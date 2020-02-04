#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

docker-compose run --rm workspace bash -ce '
  npm run lint
  npm pack --dry-run
'
