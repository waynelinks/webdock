#!/usr/bin/env bash
set -e

docker-compose run --rm --entrypoint='' workspace bash -ce "
  npm run integration-tests
"
