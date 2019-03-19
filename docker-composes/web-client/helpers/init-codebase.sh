#!/usr/bin/env sh
set -e

docker-compose exec builder \
  npm install
docker-compose exec builder \
  npm run build

docker-compose exec web_tester \
  npm install
docker-compose exec web_tester \
  npm run build
