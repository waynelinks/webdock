#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

docker build \
  --target='dist' \
  --tag="$distImage" \
  .
