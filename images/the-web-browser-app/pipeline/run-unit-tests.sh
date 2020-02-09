#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

docker run --rm --entrypoint='' "$tempBuilderImage" \
  npm run test:unit
