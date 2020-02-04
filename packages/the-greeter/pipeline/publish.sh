#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

# TODO GitHub Packages does not allow to override packages versions
#docker-compose run --rm workspace bash -ce '
#  npm publish
#'
