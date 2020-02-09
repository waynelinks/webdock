#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

docker run --rm --entrypoint='' "$distImage" ash -ce '
  which nginx
  nginx -v
'
