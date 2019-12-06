#!/usr/bin/env sh
set -e

helm lint .

kubectl create \
  --filename=./build.yaml \
  --dry-run=true \
  --validate=true
