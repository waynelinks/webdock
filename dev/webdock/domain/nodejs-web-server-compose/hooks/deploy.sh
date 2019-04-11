#!/usr/bin/env sh
set -e

echo 'Creating containers...'
docker-compose up --detach --remove-orphans
