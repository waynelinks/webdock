#!/usr/bin/env sh
set -e

# TODO GitHub packages does not support Helm yet
#helm chart pull "docker.pkg.github.com/damlys/webdock/the-web-cloud-platform:0.0.0"
helm chart export "docker.pkg.github.com/damlys/webdock/the-web-cloud-platform:0.0.0"

helm \
  --kube-context="minikube" \
  --namespace="default" \
  upgrade "the-web-cloud-platform-1" ./the-web-cloud-platform \
  --values=./values.yaml \
  --install \
  --timeout="30s"

kubectl \
  --context="minikube" \
  --namespace="default" \
  rollout status deployment the-web-cloud-platform-1-http-server \
  --timeout="30s"
