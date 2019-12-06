#!/usr/bin/env sh
set -e

httpServerPodName="$(kubectl get pod \
  --output="jsonpath={.items[0].metadata.name}" \
  --selector="app.kubernetes.io/instance=the-web-cloud-platform-0,app.kubernetes.io/name=the-web-cloud-server,app.kubernetes.io/component=http-server" \
)"
testerPodName="$(kubectl get pod \
  --output="jsonpath={.items[0].metadata.name}" \
  --selector="app.kubernetes.io/instance=the-web-cloud-platform-0,app.kubernetes.io/name=the-web-cloud-tester,app.kubernetes.io/component=tester" \
)"

kubectl exec "$httpServerPodName" -- \
  npm run integration-tests

kubectl exec "$testerPodName" -- \
  npm run integration-tests
