#!/usr/bin/env sh
set -e

docker-compose run --rm --entrypoint='' workspace bash -ce "
  rm -rf ./node_modules ./package-lock.json
  npm install
  npm run build
  chown --recursive $(id -u):$(id -g) .
"
