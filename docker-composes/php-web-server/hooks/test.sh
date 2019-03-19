#!/usr/bin/env sh
set -e

echo '[Hook] Running HTTP API tests...'
docker-compose exec http_tester \
  composer run-script target-http-api-tests

echo '[Hook] Done.'
