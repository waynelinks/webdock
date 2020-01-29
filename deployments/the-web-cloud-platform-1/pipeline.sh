#!/usr/bin/env sh
set -e

./pipeline/deploy.sh
./pipeline/run-implementation-tests.sh
