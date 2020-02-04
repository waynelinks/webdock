#!/usr/bin/env sh
set -e

./pipeline/reset.sh
./pipeline/run-lint-check.sh
./pipeline/publish.sh
