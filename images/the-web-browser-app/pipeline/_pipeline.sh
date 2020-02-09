#!/usr/bin/env sh
set -e

# TODO turn on
exit 0

export PIPELINE_JOB_ID='0'

./pipeline/build.sh
./pipeline/reset.sh
./pipeline/run-vulnerabilities-scanning.sh
./pipeline/run-lint-check.sh
./pipeline/run-unit-tests.sh
./pipeline/publish-snapshots.sh
./pipeline/deploy.sh
./pipeline/run-implementation-tests.sh
./pipeline/run-integration-tests.sh
./pipeline/run-system-tests.sh
./pipeline/destroy.sh
./pipeline/publish.sh
