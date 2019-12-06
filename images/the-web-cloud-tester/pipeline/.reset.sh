#!/usr/bin/env sh
set -e

docker-compose run --rm --entrypoint='' dist bash -ce "
  rm -rf ./node_modules ./package-lock.json
  npm install
  chown --recursive $(id -u):$(id -g) .
"
