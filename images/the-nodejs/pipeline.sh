#!/usr/bin/env sh
set -e

./pipeline/.reset.sh
./pipeline/build.sh
./pipeline/run-installation-tests.sh
./pipeline/publish.sh
