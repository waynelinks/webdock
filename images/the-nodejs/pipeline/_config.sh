imageName="$(yq read './Image.yaml' 'name')"
imageVersion="$(yq read './Image.yaml' 'version')"
rteImage="${imageName}:rte-${imageVersion}"
sdkImage="${imageName}:sdk-${imageVersion}"
