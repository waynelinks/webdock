#!/usr/bin/env sh
set -e

docker-compose run --rm --entrypoint='' workspace bash -ce "
#  npm audit
"
