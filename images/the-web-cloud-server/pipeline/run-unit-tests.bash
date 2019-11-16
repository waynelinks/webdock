#!/usr/bin/env bash
set -e

docker-compose run --rm --entrypoint='' builder bash -ce "
  npm run unit-tests
"
