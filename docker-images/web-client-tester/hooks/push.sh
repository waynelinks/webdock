#!/usr/bin/env sh
set -e

echo '[Hook] Pushing Docker image...'
docker-compose push this

echo '[Hook] Done.'
