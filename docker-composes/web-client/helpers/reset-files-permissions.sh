#!/usr/bin/env sh
set -e

docker-compose exec builder \
  chown --recursive $(id -u):$(id -g) .

docker-compose exec web_tester \
  chown --recursive $(id -u):$(id -g) .
