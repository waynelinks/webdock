#!/usr/bin/env sh
set -e

docker-compose exec cgi_server \
  composer install
docker-compose exec http_server \
  composer run-script build

docker-compose exec http_tester \
  composer install
docker-compose exec http_tester \
  composer run-script build
