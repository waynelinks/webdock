#!/usr/bin/env bash
set -e

docker-compose run --rm --entrypoint='' workspace bash -ce "
#  npm audit (NOTE it does not pass v0.0.0)
"
