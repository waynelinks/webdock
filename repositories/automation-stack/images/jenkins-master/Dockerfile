# https://github.com/jenkinsci/docker/blob/master/Dockerfile
FROM jenkins/jenkins:latest
# has user jenkins:1000
# has group jenkins:1000
# exposes port 8080 and 50000

USER root

RUN apt-get update \
&& apt-get install --yes \
  jq \
  make \
&& apt-get clean

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

ENV DOCKER_HOST="tcp://127.0.0.1:2376" \
  CASC_JENKINS_CONFIG="/etc/jenkins/casc" \
  CASC_SYSTEM_MESSAGE="This Jenkins is configured and managed \"as code\"." \
  CASC_SELF_URL="http://127.0.0.1:8080" \
  CASC_ADMIN_ADDRESS="undefined <undefined@dummy.tld>" \
  CASC_SLAVE_IMAGE="jenkins-slave:undefined" \
  CASC_SLAVE_ENVIRONMENTS="DOCKER_HOST=tcp://127.0.0.1:2376" \
  CASC_SLAVE_NETWORK="" \
  CASC_SLAVE_VOLUMES=""

COPY casc /etc/jenkins/casc
