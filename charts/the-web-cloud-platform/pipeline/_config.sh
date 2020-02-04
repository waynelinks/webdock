chartRepository="$(yq read './Chart.yaml' 'repository')"
chartVersion="$(yq read './Chart.yaml' 'version')"
chart="${chartRepository}:${chartVersion}"
