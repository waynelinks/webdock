#!/usr/bin/env bash
set -e

echo 'Running HTTP API tests...'
docker-compose exec http_tester \
  npm run target-http-api-tests
