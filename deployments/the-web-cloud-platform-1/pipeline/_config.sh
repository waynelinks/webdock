chartRepository='docker.pkg.github.com/damlys/webdock/the-web-cloud-platform'
chartVersion='0.0.0'
chart="${chartRepository}:${chartVersion}"

kubeContext='minikube'
kubeNamespace='default'
helmReleaseName='the-web-cloud-platform-1'
helmValuesPath='./values.yaml'
