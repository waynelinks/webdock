#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

helm \
  --kube-context="$kubeContext" \
  --namespace="$kubeNamespace" \
  uninstall "$helmReleaseName" \
  --timeout='30s'

kubectl \
  --context="$kubeContext" \
  --namespace="$kubeNamespace" \
  wait pod \
  --selector="app.kubernetes.io/instance=${helmReleaseName},app.kubernetes.io/component=http-server" \
  --for='delete' \
  --timeout='30s'
