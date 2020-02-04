#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

docker-compose run --rm workspace bash -ce "
  rm -rf ./node_modules ./package-lock.json
  npm install
  npm run build
  chown --recursive $(id -u):$(id -g) .
"
