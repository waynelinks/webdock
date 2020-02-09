imageName="$(yq read './Image.yaml' 'name')"
imageVersion="$(yq read './Image.yaml' 'version')"
distImage="${imageName}:dist-${imageVersion}"
