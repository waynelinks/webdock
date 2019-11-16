#!/usr/bin/env bash
set -e

docker-compose run --rm --entrypoint='' dist bash -ce "
  npm run unit-tests
"
