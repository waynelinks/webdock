#!/usr/bin/env sh
set -e
. "$(dirname "$0")/_variables.sh"

echo 'Running unit tests...'
docker run \
  --rm \
  --mount="type=volume,source=global_composer_cache,destination=/var/cache/composer" \
"${IMAGE}:${VERSION}" bash -ce '
  composer install --quiet
  composer run-script unit-tests
'
