#!/usr/bin/env sh
set -e
. "$(dirname "$0")/_variables.sh"

echo 'Building Docker image...'
docker build --target=builder --tag="${IMAGE}:builder-${VERSION}" .
echo "\n\n"
docker build --tag="${IMAGE}:${VERSION}" .
