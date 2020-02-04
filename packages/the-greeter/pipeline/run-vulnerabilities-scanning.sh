#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

# TODO audit does not pass "*" versions
#docker-compose run --rm workspace bash -ce '
#  npm audit
#'
