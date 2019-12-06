#!/usr/bin/env sh
set -e

helm \
  --namespace="default" \
  uninstall "the-web-cloud-platform-0"
