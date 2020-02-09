#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

# TODO audit does not pass "*" versions
#docker run --rm --entrypoint='' "$tempBuilderImage" \
#  npm audit
