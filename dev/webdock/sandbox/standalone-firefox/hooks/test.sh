#!/usr/bin/env sh
set -e
. "$(dirname "$0")/_variables.sh"

echo 'Running installation tests...'
docker run --rm "${IMAGE}:${VERSION}" bash -c '
  firefox --version \
  && geckodriver --version
'
