#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

helm lint .

rm -rf ./build
helm \
  --namespace='whatever' \
  template . --name-template='whatever' \
  --output-dir=./build \
> /dev/null

kubectl create \
  --filename=./build \
  --recursive \
  --dry-run=true \
  --validate=true
