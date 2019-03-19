#!/usr/bin/env sh
set -e

docker-compose exec builder \
  npm run unit-tests

docker-compose exec web_tester \
  npm run unit-tests
