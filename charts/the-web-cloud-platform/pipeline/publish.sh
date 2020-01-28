#!/usr/bin/env sh
set -e

helm chart save . "localhost:55000/webdock/the-web-cloud-platform:0.0.0"
helm chart push "localhost:55000/webdock/the-web-cloud-platform:0.0.0"
