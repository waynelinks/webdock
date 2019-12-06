#!/usr/bin/env sh
set -e

echo "---RTE---"
docker-compose run --rm --entrypoint='' rte bash -ce '
  node --version
  npm --version

  echo "node:$(id -u node)"
  if [[ "$(id -u node)" != "1000" ]]
  then
    echo "ERROR: User node:1000 does not exist."
    exit 1
  fi

  echo "$NODE_ENV"
  if [[ "$NODE_ENV" != "production" ]]
  then
    echo "ERROR: Default NODE_ENV value is not correct."
    exit 1
  fi
'

echo "---SDK---"
docker-compose run --rm --entrypoint='' sdk bash -ce '
  node --version
  npm --version

  echo "$NODE_ENV"
  if [[ "$NODE_ENV" != "development" ]]
  then
    echo "ERROR: Default NODE_ENV value is not correct."
    exit 1
  fi

  npm config get cache
  if [[ "$(npm config get cache)" != "/var/cache/npm" ]]
  then
    echo "ERROR: NPM cache directory is not correct."
    exit 1
  fi
'
