#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

helm chart save . "$chart"
# TODO GitHub Packages does not support Helm OCI yet
#helm chart push "$chart"
