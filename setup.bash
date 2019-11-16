#!/usr/bin/env bash
set -e

# Function displays "\n*** 23:59:59 *** Foo bar baz **********************************************...\n\n"
terminalColumnsCount="$(tput cols || echo 80)"
function header() {
  local row="*** $(date "+%T") *** $1 ***"
  while [[ "${#row}" -lt "$terminalColumnsCount" ]]
  do
    row="$row*"
  done
  printf "\n\e[90m$row\e[0m\n\n"
}

header "START"

header "Deploying local NPM packages registry (Verdaccio)"
docker volume create --driver=local npm_registry_data
docker start npm_registry || docker run \
  --detach \
  --restart=always \
  --publish=54873:4873 \
  --mount=type=volume,source=npm_registry_data,destination=/verdaccio/storage \
  --name=npm_registry \
verdaccio/verdaccio:latest
echo "
Dashboard:          http://127.0.0.1:54873
"

header "Deploying local Docker images registry"
docker volume create --driver=local docker_registry_data
docker start docker_registry || docker run \
  --detach \
  --restart=always \
  --publish=55000:5000 \
  --mount=type=volume,source=docker_registry_data,destination=/var/lib/registry \
  --name=docker_registry \
registry:latest
echo "
Images list:        http://127.0.0.1:55000/v2/_catalog
Image tags:         http://127.0.0.1:55000/v2/<name>/tags/list
"

header "Deploying local Helm charts registry (ChartMuseum)"
docker volume create --driver=local helm_registry_data
docker start helm_registry || docker run \
  --detach \
  --restart=always \
  --publish=58080:8080 \
  --mount=type=volume,source=helm_registry_data,destination=/charts \
  --env=ALLOW_OVERWRITE=true \
  --env=STORAGE=local \
  --env=STORAGE_LOCAL_ROOTDIR=/charts \
  --user=0 \
  --name=helm_registry \
chartmuseum/chartmuseum:latest
helm repo add webdock http://127.0.0.1:58080
echo "
Charts list:        http://127.0.0.1:58080/api/charts
Chart details:      http://127.0.0.1:58080/api/charts/<name>/<version>
"

header "Creating Docker cache volumes"
docker volume create --driver=local global_npm_cache

header "Creating Kubernetes cache volumes"
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

header "END"
echo "Success!"
