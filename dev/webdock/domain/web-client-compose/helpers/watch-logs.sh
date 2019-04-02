#!/usr/bin/env sh
set -e

docker-compose logs --timestamps --tail 0 --follow
