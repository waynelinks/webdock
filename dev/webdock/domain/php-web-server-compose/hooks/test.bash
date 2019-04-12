#!/usr/bin/env bash
set -e

echo 'Running HTTP API tests...'
docker-compose exec http_tester \
  composer run-script target-http-api-tests
