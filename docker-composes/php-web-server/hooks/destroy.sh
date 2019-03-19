#!/usr/bin/env sh
set -e

echo '[Hook] Removing containers...'
docker-compose down --remove-orphans

echo '[Hook] Done.'
