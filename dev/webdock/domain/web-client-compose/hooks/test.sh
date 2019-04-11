#!/usr/bin/env sh
set -e

echo 'Running GUI tests...'
docker-compose exec web_tester \
  npm run target-gui-tests
