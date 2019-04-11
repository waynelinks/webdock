#!/usr/bin/env sh
set -e
. "$(dirname "$0")/_variables.sh"

echo 'Building Docker image...'
docker build --tag="${IMAGE}:${VERSION}" .
