#!/usr/bin/env bash
set -e
. "$(dirname "$0")/_variables.bash"

echo 'Building Docker image...'
docker build --target=builder --tag="${IMAGE}:builder-${VERSION}" .
docker build --tag="${IMAGE}:${VERSION}" .
