#!/usr/bin/env sh
set -e

helm \
  --namespace="default" \
  upgrade "the-web-cloud-platform-0" . \
  --values=./values.override.yaml \
  --install \
  --wait
