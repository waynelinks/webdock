#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

# TODO GitHub Packages does not support Helm OCI yet
#helm chart pull "$chart"
helm chart export "$chart"

helm \
  --kube-context="$kubeContext" \
  --namespace="$kubeNamespace" \
  upgrade "$helmReleaseName" ./the-web-browser-platform \
  --values="$helmValuesPath" \
  --install \
  --wait
