#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

docker pull nginx:1.16-alpine
