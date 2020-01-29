#!/usr/bin/env sh
set -e

if helm \
  --kube-context="minikube" \
  --namespace="default" \
  test "the-web-cloud-platform-1" \
  --timeout="30s"
then
  echo "Deployment passes the tests."

  exit 0
else
  echo "Error! Rolling back the deployment..."

  helm \
    --kube-context="minikube" \
    --namespace="default" \
    rollback "the-web-cloud-platform-1" \
    --timeout="30s"

  kubectl \
    --context="minikube" \
    --namespace="default" \
    rollout status deployment the-web-cloud-platform-1-http-server \
    --timeout="30s"

  exit 1
fi
