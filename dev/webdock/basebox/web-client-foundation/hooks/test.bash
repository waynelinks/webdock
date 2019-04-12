#!/usr/bin/env bash
set -e
. "$(dirname "$0")/_variables.bash"

echo 'Running installation tests...'
docker run --rm "${IMAGE}:${VERSION}" bash -ce '
  nginx -v
  curl --version
  envsubst --version
'
