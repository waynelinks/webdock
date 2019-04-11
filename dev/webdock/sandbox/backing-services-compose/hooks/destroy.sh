#!/usr/bin/env sh
set -e

echo 'Removing containers...'
docker-compose down --remove-orphans
