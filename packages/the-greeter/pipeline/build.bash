#!/usr/bin/env bash
set -e

docker-compose run --rm --entrypoint='' workspace bash -ce "
  npm install
  npm run build
"
