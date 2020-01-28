#!/usr/bin/env bash
set -e

# Function displays "\n*** 23:59:59 *** Foo bar baz **********************************************...\n\n"
terminalColumnsCount="$(tput cols || echo 80)"
function printPipelineHeader() {
  local row="*** $(date "+%T") *** $1 ***"
  while [[ "${#row}" -lt "$terminalColumnsCount" ]]
  do
    row="$row*"
  done
  printf "\n\e[90m$row\e[0m\n\n"
}

pipelineWatch="1"
pipelinePauseMessage="Press a key...

[Enter]   Continue
[Esc]     Disable pausing and continue
[Ctrl+C]  Break
"
function pausePipeline() {
  if [ "$pipelineWatch" == "1" ]
  then
    printPipelineHeader "Pause"
    printf "$pipelinePauseMessage"
    read -s -n1 keyPressed
    case "$keyPressed" in
      $'\e') # Escape
        pipelineWatch="0"
      ;;
    esac
    clear
    clear
  fi
}

printPipelineHeader "START"
git clean -d -X -f -e '!/.idea'
pausePipeline

printPipelineHeader "Deploying local NPM registry (Verdaccio)"
docker volume create --driver=local npm_registry_data
docker start npm_registry || docker run \
  --detach \
  --restart=always \
  --publish=54873:4873 \
  --mount=type=volume,source=npm_registry_data,destination=/verdaccio/storage \
  --name=npm_registry \
verdaccio/verdaccio:latest
echo "
Dashboard:          http://localhost:54873
"
pausePipeline

printPipelineHeader "Deploying local OCI registry (Docker Registy)"
docker volume create --driver=local oci_registry_data
docker start oci_registry || docker run \
  --detach \
  --restart=always \
  --publish=55000:5000 \
  --mount=type=volume,source=oci_registry_data,destination=/var/lib/registry \
  --name=oci_registry \
registry:latest
echo "
Artifacts list:     http://localhost:55000/v2/_catalog
Artifacts tags:     http://localhost:55000/v2/<name>/tags/list
"
pausePipeline

printPipelineHeader "Login to local OCI registry"
docker login --username="whatever" --password="whatever" "localhost:55000"
helm registry login "localhost:55000" --username="whatever" --password="whatever"

printPipelineHeader "Creating Docker cache volumes"
docker volume create --driver=local global_npm_cache
pausePipeline

printPipelineHeader "Creating Kubernetes cache volumes"
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  name: global-npm-cache
  labels:
    volume: global-npm-cache
spec:
  storageClassName: manual
  capacity:
    storage: 1G
  accessModes:
    - ReadWriteOnce
  hostPath:
    type: Directory
    path: "$(docker volume inspect global_npm_cache --format="{{ .Mountpoint }}")"
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: global-npm-cache
  labels:
    volume: global-npm-cache
spec:
  storageClassName: manual
  resources:
    requests:
      storage: 1G
  accessModes:
    - ReadWriteOnce
  selector:
    matchLabels:
      volume: global-npm-cache
EOF
pausePipeline

for projectComponent in \
  'images/the-nodejs' \
  'packages/the-greeter' \
  'images/the-web-cloud-server' \
  'images/the-web-cloud-tester' \
  'images/the-web-browser-client' \
  'images/the-web-browser-tester' \
  'charts/the-web-cloud-platform' \
  'charts/the-web-browser-platform' \
  'deployments/the-web-cloud-platform-1' \
  'deployments/the-web-browser-platform-1'
do
  printPipelineHeader "Entering project component *** $projectComponent"
  cd "$projectComponent"
  pwd
  pausePipeline

  printPipelineHeader "Linking example config *** $PWD/.examples"
  for exampleConfig in \
    '.env' \
    'docker-compose.override.yml' \
    'values.override.yaml'
  do
    if [[ -f ".examples/$exampleConfig" ]]
    then
      ln --symbolic --verbose ".examples/$exampleConfig" .
    fi
  done
  pausePipeline

  printPipelineHeader "Executing script *** $PWD/pipeline.sh"
  if [[ -x "./pipeline.sh" ]]
  then
    ./pipeline.sh
  fi
  pausePipeline

  printPipelineHeader "Leaving project component *** $projectComponent"
  cd ../..
  pwd
  pausePipeline
done

printPipelineHeader "END"
echo "Success!"
