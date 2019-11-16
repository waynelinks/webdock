#!/usr/bin/env bash
set -e

kubectl exec $(kubectl get pod --output=jsonpath="{.items[0].metadata.name}" --selector="app.kubernetes.io/name=the-web-cloud-tester,app.kubernetes.io/component=tester") -- \
  npm run target-api-tests
