#!/usr/bin/env bash
set -e

helm upgrade "local" . \
  --install \
  --wait \
  --values=./values.local.yaml
