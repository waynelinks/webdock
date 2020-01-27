#!/usr/bin/env sh
set -e

helm \
  --namespace="default" \
  test "the-web-cloud-platform-0"
