#!/usr/bin/env sh
set -e
. "$(dirname "$0")/_variables.sh"

echo 'Running unit tests...'
docker run \
  --rm \
  --mount="type=volume,source=global_npm_cache,destination=/var/cache/npm" \
  --mount="type=volume,source=global_yarn_cache,destination=/var/cache/yarn" \
"${IMAGE}:builder-${VERSION}" bash -ce '
  NODE_ENV="development" npm install --loglevel error > /dev/null
  npm run unit-tests
'
