#!/usr/bin/env bash
set -e

docker-compose exec http_server \
  npm install
docker-compose exec http_server \
  npm run build

docker-compose exec http_tester \
  npm install
docker-compose exec http_tester \
  npm run build
