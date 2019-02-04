# https://github.com/jenkinsci/docker/blob/master/Dockerfile-alpine
FROM jenkins/jenkins:alpine

USER root

RUN apk update \
&& apk add --no-cache \
  jq \
  make

# docker (https://download.docker.com/linux/static/stable/x86_64/)
RUN DOCKER_VERSION="18.09.0" \
&& mkdir -p /var/tmp/docker-setup \
&& curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz -o /var/tmp/docker-setup/archive.tgz \
&& tar -zxf /var/tmp/docker-setup/archive.tgz -C /var/tmp/docker-setup \
&& mv /var/tmp/docker-setup/docker/docker /usr/local/bin/docker \
&& rm -rf /var/tmp/docker-setup \
&& chmod a+rx /usr/local/bin/docker

USER jenkins

RUN /usr/local/bin/install-plugins.sh \
  ansicolor \
  configuration-as-code \
  docker-plugin \
  generic-webhook-trigger \
  git \
  git-parameter \
  matrix-auth \
  pipeline-stage-view \
  ssh-agent \
  workflow-aggregator

ENV DOCKER_HOST="tcp://127.0.0.1:2376"
ENV REGISTRY_HOST="127.0.0.1:5000"
ENV CASC_JENKINS_CONFIG="/etc/jenkins/casc"
ENV CASC_SYSTEM_MESSAGE="This Jenkins is configured and managed \"as code\"."
ENV CASC_SELF_URL="http://127.0.0.1"
ENV CASC_ADMIN_ADDRESS="undefined <undefined@dummy.tld>"
ENV CASC_SLAVE_IMAGE="jenkins/jnlp-slave:latest"
ENV CASC_SLAVE_ENVIRONMENTS=""
ENV CASC_SLAVE_NETWORK=""
ENV CASC_SLAVE_VOLUMES=""

COPY casc /etc/jenkins/casc
