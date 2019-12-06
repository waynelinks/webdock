#!/usr/bin/env sh
set -e

docker-compose run --rm --entrypoint='' dist bash -ce "
  npm run lint
"
