#!/usr/bin/env sh
set -e

echo '[Hook] Running unit tests...'
docker-compose run --rm this bash -c '
  composer install --quiet \
  && composer run-script unit-tests
'

echo '[Hook] Done.'
