#!/usr/bin/env sh
set -e

echo '[Hook] Running installation tests...'
docker-compose run --rm this bash -c '
  node --version \
  && npm --version \
  && git --version
'
echo '[Hook] Done.'
