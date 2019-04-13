#!/usr/bin/env bash
set -e

docker-compose exec http_tester \
  npm run target-http-api-tests
