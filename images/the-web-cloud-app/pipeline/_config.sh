imageName="$(yq read './Image.yaml' 'name')"
imageVersion="$(yq read './Image.yaml' 'version')"
builderImage="${imageName}:builder-${imageVersion}"
distImage="${imageName}:dist-${imageVersion}"

tempImageName="${imageName}"
tempImageVersion="${imageVersion}-${PIPELINE_JOB_ID:-undefined}"
tempBuilderImage="${tempImageName}:builder-${tempImageVersion}"
tempDistImage="${tempImageName}:dist-${tempImageVersion}"

chartRepository='docker.pkg.github.com/damlys/webdock/the-web-cloud-platform'
chartVersion='0.0.0'
chart="${chartRepository}:${chartVersion}"

kubeContext='minikube'
kubeNamespace='default'
helmReleaseName="the-web-cloud-app-${PIPELINE_JOB_ID:-undefined}"
helmValuesPath='./values.yaml'
