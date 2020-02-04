#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

echo "---RTE---"
docker run --rm --entrypoint='' "$rteImage" bash -ce '
  which node
  node --version
  which npm
  npm --version

  echo "$NODE_ENV"
  if [[ "$NODE_ENV" != "production" ]]
  then
    echo "ERROR: Default NODE_ENV value is not correct."
    exit 1
  fi

  echo "node:$(id -u node)"
  if [[ "$(id -u node)" != "1000" ]]
  then
    echo "ERROR: User node:1000 does not exist."
    exit 1
  fi

  npm config get cache
  if [[ "$(npm config get cache)" != "/var/cache/npm" ]]
  then
    echo "ERROR: NPM cache directory is not correct."
    exit 1
  fi
'

echo "---SDK---"
docker run --rm --entrypoint='' "$sdkImage" bash -ce '
  which node
  node --version
  which npm
  npm --version

  echo "$NODE_ENV"
  if [[ "$NODE_ENV" != "development" ]]
  then
    echo "ERROR: Default NODE_ENV value is not correct."
    exit 1
  fi

  echo "node:$(id -u node)"
  if [[ "$(id -u node)" != "1000" ]]
  then
    echo "ERROR: User node:1000 does not exist."
    exit 1
  fi

  npm config get cache
  if [[ "$(npm config get cache)" != "/var/cache/npm" ]]
  then
    echo "ERROR: NPM cache directory is not correct."
    exit 1
  fi
'
