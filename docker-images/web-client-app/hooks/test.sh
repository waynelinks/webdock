#!/usr/bin/env sh
set -e

echo '[Hook] Running unit tests...'
docker-compose run --rm builder bash -c '
  NODE_ENV="development" npm install --loglevel error > /dev/null \
  && npm run unit-tests
'

echo '[Hook] Done.'
