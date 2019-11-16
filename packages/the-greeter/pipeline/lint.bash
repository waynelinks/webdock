#!/usr/bin/env bash
set -e

docker-compose run --rm --entrypoint='' workspace bash -ce "
  npm run lint
  npm pack --dry-run
"
