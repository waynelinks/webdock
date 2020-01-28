#!/usr/bin/env sh
set -e

# TODO GitHub packages does not support Helm yet (https://github.community/t5/GitHub-Actions/Feature-Request-Support-Helm-Charts-in-GitHub-Package-Registry/td-p/39186)
#helm chart pull "docker.pkg.github.com/damlys/webdock/the-web-cloud-platform:0.0.0"
helm chart export "docker.pkg.github.com/damlys/webdock/the-web-cloud-platform:0.0.0"

helm \
  --kube-context="minikube" \
  --namespace="default" \
  upgrade "the-web-cloud-platform-1" ./the-web-cloud-platform \
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
