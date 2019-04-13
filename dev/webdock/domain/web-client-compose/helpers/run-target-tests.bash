#!/usr/bin/env bash
set -e

docker-compose exec web_tester \
  npm run target-gui-tests
