#!/usr/bin/env sh
set -e

helm \
  --kube-context="minikube" \
  --namespace="default" \
  uninstall "the-web-cloud-platform-1" \
  --timeout="30s"

kubectl \
  --context="minikube" \
  --namespace="default" \
  wait pod \
  --selector="app.kubernetes.io/instance=the-web-cloud-platform-1,app.kubernetes.io/component=http-server" \
  --for="delete" \
  --timeout="30s"
