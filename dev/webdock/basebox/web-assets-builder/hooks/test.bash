#!/usr/bin/env bash
set -e
. "$(dirname "$0")/_variables.bash"

echo 'Running installation tests...'
docker run --rm "${IMAGE}:${VERSION}" bash -ce '
  sass --version
  tsc --version
  webpack --version
  webpack-cli --version
'
