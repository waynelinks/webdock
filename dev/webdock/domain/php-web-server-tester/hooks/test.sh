#!/usr/bin/env sh
set -e
. "$(dirname "$0")/_variables.sh"

echo 'Running unit tests...'
docker run \
  --rm \
  --mount="type=volume,volume-driver=local,src=global_composer_cache,dst=/root/.composer/cache" \
"${IMAGE}:${VERSION}" bash -c '
  composer install --quiet \
  && composer run-script unit-tests
'
