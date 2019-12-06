#!/usr/bin/env sh
set -e

testerPodName="$(kubectl get pod \
  --output="jsonpath={.items[0].metadata.name}" \
  --selector="app.kubernetes.io/instance=the-web-cloud-platform-0,app.kubernetes.io/name=the-web-cloud-tester,app.kubernetes.io/component=tester" \
)"

kubectl exec "$testerPodName" -- \
  npm run target-api-tests
