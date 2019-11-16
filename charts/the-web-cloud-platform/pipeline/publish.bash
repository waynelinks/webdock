#!/usr/bin/env bash
set -e

helm push . http://127.0.0.1:58080

rm -fv ./*.tgz
helm package .
