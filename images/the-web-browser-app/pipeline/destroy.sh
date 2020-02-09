#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

helm \
  --kube-context="$kubeContext" \
  --namespace="$kubeNamespace" \
  uninstall "$helmReleaseName"
