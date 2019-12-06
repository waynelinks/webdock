#!/usr/bin/env sh
set -e

rm -fv ./build.yaml
helm \
  --namespace="default" \
  template . --name-template="the-web-cloud-platform-0" \
  --values=./values.override.yaml \
> ./build.yaml
echo "wrote ./build.yaml"

rm -rfv ./build
helm \
  --namespace="default" \
  template . --name-template="the-web-cloud-platform-0" \
  --values=./values.override.yaml \
  --output-dir=./build
