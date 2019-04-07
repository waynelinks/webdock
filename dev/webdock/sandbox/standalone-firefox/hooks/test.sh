#!/usr/bin/env sh
set -e

echo '[Hook] Running installation tests...'
docker-compose run --rm this bash -c '
  firefox --version \
  && geckodriver --version
'

echo '[Hook] Done.'
