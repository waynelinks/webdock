#!/usr/bin/env sh
set -e

helm \
  --kube-context="minikube" \
  --namespace="default" \
  upgrade "the-web-cloud-platform-1" \
  "webdock/the-web-cloud-platform" --version="0.0.0" \
  --set-string="httpServer.image.tag=dist-0.0.0" \
  --set-string="tester.image.tag=dist-0.0.0" \
  --values=./values.yaml \
  --install \
  --wait

helm \
  --kube-context="minikube" \
  --namespace="default" \
  test "the-web-cloud-platform-1"

#helm \
#  --kube-context="minikube" \
#  --namespace="default" \
#  uninstall "the-web-cloud-platform-1"
