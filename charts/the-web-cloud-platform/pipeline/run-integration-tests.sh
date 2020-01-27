#!/usr/bin/env sh
set -e

httpServerPodName="$(kubectl \
  --namespace="default" \
  get pod \
  --output="jsonpath={.items[0].metadata.name}" \
  --selector="app.kubernetes.io/instance=the-web-cloud-platform-0,app.kubernetes.io/name=the-web-cloud-server,app.kubernetes.io/component=http-server" \
)"
testerPodName="$(kubectl \
  --namespace="default" \
  get pod \
  --output="jsonpath={.items[0].metadata.name}" \
  --selector="app.kubernetes.io/instance=the-web-cloud-platform-0,app.kubernetes.io/name=the-web-cloud-tester,app.kubernetes.io/component=tester" \
)"

kubectl \
  --namespace="default" \
  exec "$httpServerPodName" -- \
  npm run integration-tests

kubectl \
  --namespace="default" \
  exec "$testerPodName" -- \
  npm run integration-tests
