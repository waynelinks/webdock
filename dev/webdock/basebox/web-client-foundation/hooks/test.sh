#!/usr/bin/env sh
set -e

echo '[Hook] Running installation tests...'
docker-compose run --rm this bash -c "
  nginx -v \
  && curl --version \
  && envsubst --version
"

echo '[Hook] Done.'
