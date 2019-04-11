#!/usr/bin/env sh
set -e
. "$(dirname "$0")/_variables.sh"

echo 'Running unit tests...'
docker run \
  --rm \
  --mount="type=volume,volume-driver=local,src=global_npm_cache,dst=/root/.npm" \
"${IMAGE}:builder-${VERSION}" bash -c '
  NODE_ENV="development" npm install --loglevel error > /dev/null \
  && npm run unit-tests
'
