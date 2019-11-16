#!/usr/bin/env bash
set -e

docker-compose run --rm --entrypoint='' workspace bash -ce "
#  npm unpublish --force
#  npm publish (NOTE it can't push package to locally deployed repository)

  rm -f ./*.tgz
  npm pack
"
