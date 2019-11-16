#!/usr/bin/env bash
set -e

helm lint .

kubectl create \
  --validate=true \
  --dry-run=true \
  --filename=./build.yaml
