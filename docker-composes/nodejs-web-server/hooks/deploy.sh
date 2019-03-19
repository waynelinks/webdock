#!/usr/bin/env sh
set -e

echo '[Hook] Creating containers...'
docker-compose up --detach --remove-orphans

echo '[Hook] Done.'
