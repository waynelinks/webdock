#!/usr/bin/env sh
set -e

./pipeline/.reset.sh
./pipeline/build.sh
./pipeline/lint.sh
./pipeline/deploy.sh
./pipeline/run-implementation-tests.sh
./pipeline/run-integration-tests.sh
./pipeline/run-system-tests.sh
./pipeline/destroy.sh
./pipeline/publish.sh
