#!/usr/bin/env bash
set -e
. "$(dirname "$0")/_variables.bash"

echo 'Running installation tests...'
docker run --rm "${IMAGE}:${VERSION}" bash -ce '
  node --version
  npm --version
  yarn --version

  npm config get cache
  if [[ "$(npm config get cache)" != "/var/cache/npm" ]]
  then
    echo "ERROR: NPM cache directory for user root is not correct."
    exit 1
  fi

  yarn cache dir
  if [[ "$(yarn cache dir)" != "/var/cache/yarn"* ]]
  then
    echo "ERROR: Yarn cache directory for user root is not correct."
    exit 1
  fi
'

docker run --rm --user=node "${IMAGE}:${VERSION}" bash -ce '
  npm config get cache
  if [[ "$(npm config get cache)" != "/var/cache/npm" ]]
  then
    echo "ERROR: NPM cache directory for user node is not correct."
    exit 1
  fi

  yarn cache dir
  if [[ "$(yarn cache dir)" != "/var/cache/yarn"* ]]
  then
    echo "ERROR: Yarn cache directory for user node is not correct."
    exit 1
  fi
'
