#!/usr/bin/env sh
set -e
. "$(dirname "$0")/_variables.sh"

echo 'Pushing Docker image...'
docker push "${IMAGE}:${VERSION}"
