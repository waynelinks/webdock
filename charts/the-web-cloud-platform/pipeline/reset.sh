#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

helm dependency update .
