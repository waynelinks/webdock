#!/usr/bin/env sh
set -e
. "$(dirname "$0")/_variables.sh"

echo 'Running installation tests...'
docker run --rm "${IMAGE}:${VERSION}" bash -c '
  node --version \
  && npm --version \
  && git --version \
  && sass --version \
  && tsc --version \
  && webpack --version \
  && webpack-cli --version
'
