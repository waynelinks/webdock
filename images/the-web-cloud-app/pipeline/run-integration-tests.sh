#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

testerPodName="$(kubectl \
  --context="$kubeContext" \
  --namespace="$kubeNamespace" \
  get pod \
  --selector="app.kubernetes.io/instance=${helmReleaseName},app.kubernetes.io/component=tester" \
  --output='jsonpath={.items[0].metadata.name}' \
)"

kubectl \
  --context="$kubeContext" \
  --namespace="$kubeNamespace" \
  exec "$testerPodName" \
  -- \
  npm run test:integration
