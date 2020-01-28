#!/usr/bin/env sh
set -e

helm chart save . "docker.pkg.github.com/damlys/webdock/the-web-cloud-platform:0.0.0"
# TODO GitHub packages does not support Helm yet (https://github.community/t5/GitHub-Actions/Feature-Request-Support-Helm-Charts-in-GitHub-Package-Registry/td-p/39186)
#helm chart push "docker.pkg.github.com/damlys/webdock/the-web-cloud-platform:0.0.0"
