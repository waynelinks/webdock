#!/usr/bin/env sh
set -e

echo '[Hook] Building Docker image...'
docker-compose build

echo '[Hook] Done.'
