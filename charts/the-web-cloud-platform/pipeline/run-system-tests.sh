#!/usr/bin/env sh
set -e

testerPodName="$(kubectl \
  --namespace="default" \
  get pod \
  --selector="app.kubernetes.io/instance=the-web-cloud-platform-0,app.kubernetes.io/name=the-web-cloud-app,app.kubernetes.io/component=tester" \
  --output="jsonpath={.items[0].metadata.name}" \
)"

kubectl \
  --namespace="default" \
  exec "$testerPodName" -- \
  npm run api-tests
