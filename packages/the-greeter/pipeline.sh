#!/usr/bin/env sh
set -e

./pipeline/build.sh
./pipeline/.reset.sh
./pipeline/run-vulnerabilities-scanning.sh
./pipeline/lint.sh
./pipeline/run-unit-tests.sh
./pipeline/run-integration-tests.sh
./pipeline/publish.sh
