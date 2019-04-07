#!/usr/bin/env sh
set -e

echo '[Hook] Running GUI tests...'
docker-compose exec web_tester \
  npm run target-gui-tests

echo '[Hook] Done.'
