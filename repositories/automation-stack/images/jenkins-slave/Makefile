#!/usr/bin/env make

DOCKER_IMAGE_PREFIX=damlys/webdock-
draftVersion=unreleased
version=latest

define run
	docker run --rm --entrypoint="" ${DOCKER_IMAGE_PREFIX}jenkins-slave:${draftVersion} $(1)
endef

default: shell

which:
	@echo "${DOCKER_IMAGE_PREFIX}jenkins-slave"
build:
	docker build --tag ${DOCKER_IMAGE_PREFIX}jenkins-slave:${draftVersion} .
shell:
	docker run --interactive --tty --rm ${DOCKER_IMAGE_PREFIX}jenkins-slave:${draftVersion} bash
test:
	$(call run,curl --version)
	$(call run,docker --version)
	$(call run,docker-compose --version)
	$(call run,git --version)
	$(call run,helm version --client --short)
	$(call run,jq --version)
	$(call run,kubectl version --client --short)
	$(call run,make --version)
	$(call run,notary version)
	$(call run,vault --version)
tag:
	docker tag ${DOCKER_IMAGE_PREFIX}jenkins-slave:${draftVersion} ${DOCKER_IMAGE_PREFIX}jenkins-slave:${version}
push:
	docker push ${DOCKER_IMAGE_PREFIX}jenkins-slave:${version}
release: tag push
