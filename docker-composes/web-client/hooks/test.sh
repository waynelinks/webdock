#!/usr/bin/env sh
set -e

echo '[Hook] Running GUI tests...'
sleep 15 # Selenium hack
docker-compose exec web_tester \
  npm run target-gui-tests-with-chrome
docker-compose exec web_tester \
  npm run target-gui-tests-with-firefox

echo '[Hook] Done.'
