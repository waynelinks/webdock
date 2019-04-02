#!/usr/bin/env sh
set -e

docker-compose exec http_server \
  chown --recursive $(id -u):$(id -g) .

docker-compose exec http_tester \
  chown --recursive $(id -u):$(id -g) .
