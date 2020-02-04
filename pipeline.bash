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

pipelinePauseMessage="Press a key...

[Enter]   Continue
[Esc]     Disable pausing and continue
[Ctrl+C]  Break
"
pipelineWatch="1"
function pausePipeline() {
  if [ "$pipelineWatch" == "1" ]
  then
    printPipelineHeader "Pause"
    printf "$pipelinePauseMessage"
    read -s -n1 pressedKeyCode
    case "$pressedKeyCode" in
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
  'charts/the-web-cloud-platform' \
  'charts/the-web-browser-platform' \
  'images/the-nodejs' \
  'packages/the-greeter' \
  'images/the-web-cloud-app' \
  'images/the-web-browser-app' \
  'deployments/the-web-cloud-platform-1' \
  'deployments/the-web-browser-platform-1'
do
  printPipelineHeader "Entering project component *** $projectComponent"
  cd "$projectComponent"
  pwd

  printPipelineHeader "Linking example config *** $PWD/.examples"
  for configFile in \
    'docker-compose.override.yml' \
    'values.yaml'
  do
    if [[ -f ".examples/$configFile" ]]
    then
      ln --symbolic --verbose ".examples/$configFile" .
    fi
  done

  printPipelineHeader "Executing script *** $PWD/pipeline/_all.sh"
  if [[ -x "./pipeline/_all.sh" ]]
  then
    ./pipeline/_all.sh
  fi

  printPipelineHeader "Leaving project component *** $projectComponent"
  cd ../..
  pwd

  pausePipeline
done

printPipelineHeader "END"
echo "Done!"
