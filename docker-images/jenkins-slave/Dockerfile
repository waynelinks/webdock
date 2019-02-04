FROM jenkins/jnlp-slave:alpine

USER root

RUN apk update \
&& apk add --no-cache \
  curl \
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

# docker-compose (https://github.com/docker/compose/releases)
RUN COMPOSE_VERSION="1.23.2" \
&& apk add --no-cache \
  py-pip \
&& pip install --no-cache-dir \
  docker-compose==${COMPOSE_VERSION}

# kubectl (https://storage.googleapis.com/kubernetes-release/release/stable.txt)
RUN KUBERNETES_VERSION="1.13.0" \
&& curl -fsSL https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
&& chmod a+rx /usr/local/bin/kubectl

# helm (https://github.com/kubernetes/helm/releases)
RUN HELM_VERSION="2.11.0" \
&& mkdir -p /var/tmp/helm-setup \
&& curl -fsSL https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o /var/tmp/helm-setup/archive.tar.gz \
&& tar -zxf /var/tmp/helm-setup/archive.tar.gz -C /var/tmp/helm-setup \
&& mv /var/tmp/helm-setup/linux-amd64/helm /usr/local/bin/helm \
&& rm -rf /var/tmp/helm-setup \
&& chmod a+rx /usr/local/bin/helm

# notary (https://github.com/theupdateframework/notary/releases)
RUN NOTARY_VERSION="0.6.1" \
&& curl -fsSL https://github.com/theupdateframework/notary/releases/download/v${NOTARY_VERSION}/notary-Linux-amd64 -o /usr/local/bin/notary \
&& chmod a+rx /usr/local/bin/notary

# vault (https://releases.hashicorp.com/vault/)
RUN VAULT_VERSION="1.0.0" \
&& mkdir -p /var/tmp/vault-setup \
&& curl -fsSL https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -o /var/tmp/vault-setup/archive.zip \
&& unzip /var/tmp/vault-setup/archive.zip -d /var/tmp/vault-setup \
&& mv /var/tmp/vault-setup/vault /usr/local/bin/vault \
&& rm -rf /var/tmp/vault-setup \
&& chmod a+rx /usr/local/bin/vault

USER jenkins

ENV DOCKER_HOST="tcp://127.0.0.1:2376"
ENV REGISTRY_HOST="127.0.0.1:5000"
