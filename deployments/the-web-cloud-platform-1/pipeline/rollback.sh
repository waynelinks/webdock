#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

helm \
  --kube-context="$kubeContext" \
  --namespace="$kubeNamespace" \
  rollback "$helmReleaseName" \
  --timeout='30s'

kubectl \
  --context="$kubeContext" \
  --namespace="$kubeNamespace" \
  rollout status deployment "${helmReleaseName}-http-server" \
  --timeout='30s'
