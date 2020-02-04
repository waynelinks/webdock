#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

docker build \
  --build-arg='GITHUB_PACKAGES_TOKEN' \
  --build-arg='NPM_TOKEN' \
  --target='builder' \
  --tag="$tempBuilderImage" \
  .

docker build \
  --build-arg='GITHUB_PACKAGES_TOKEN' \
  --build-arg='NPM_TOKEN' \
  --target='dist' \
  --tag="$tempDistImage" \
  .
