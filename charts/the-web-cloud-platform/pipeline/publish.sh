#!/usr/bin/env sh
set -e

helm chart save . "docker.pkg.github.com/damlys/webdock/the-web-cloud-platform:0.0.0"
# TODO GitHub packages does not support Helm yet
#helm chart push "docker.pkg.github.com/damlys/webdock/the-web-cloud-platform:0.0.0"
