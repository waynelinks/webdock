#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

docker run \
  --rm \
  --entrypoint='' \
  --env='GITHUB_PACKAGES_TOKEN' \
  --env='NPM_TOKEN' \
  --mount="type=bind,source=$(pwd),destination=/app" \
  "$tempBuilderImage" bash -ce "
    rm -rf ./node_modules ./package-lock.json
    npm install
    npm run build
    chown --recursive $(id -u):$(id -g) .
  "
