#!/usr/bin/env bash
set -e

docker-compose exec http_server \
  npm run unit-tests

docker-compose exec http_tester \
  npm run unit-tests
