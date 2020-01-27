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

if helm \
  --kube-context="minikube" \
  --namespace="default" \
  test "the-web-cloud-platform-1"
then
  echo "Deployment passes the tests."
  exit 0
else
  echo "Error! Rolling back the deployment..."
  helm \
    --kube-context="minikube" \
    --namespace="default" \
    rollback "the-web-cloud-platform-1" \
    --wait
  exit 1
fi
