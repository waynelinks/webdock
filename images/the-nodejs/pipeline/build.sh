#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

docker build \
  --target='rte' \
  --tag="$rteImage" \
  .

docker build \
  --target='sdk' \
  --tag="$sdkImage" \
  .
