#!/usr/bin/env bash
set -e

rm -fv ./build.yaml
helm template \
  --name-template="local" \
  --namespace="default" \
  --values=./values.local.yaml \
-- . > ./build.yaml
echo "wrote ./build.yaml"

rm -rfv ./build
helm template \
  --name-template="local" \
  --namespace="default" \
  --values=./values.local.yaml \
  --output-dir=. \
-- .
mv -v ./${PWD##*/} ./build
