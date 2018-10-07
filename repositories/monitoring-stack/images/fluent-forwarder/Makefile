#!/usr/bin/env make

DOCKER_IMAGE_PREFIX=damlys/webdock-
draftVersion=unreleased
version=latest

define run
	docker run --rm ${DOCKER_IMAGE_PREFIX}fluent-forwarder:${draftVersion} $(1)
endef

default: shell

which:
	@echo "${DOCKER_IMAGE_PREFIX}fluent-forwarder"
build:
	docker build --tag ${DOCKER_IMAGE_PREFIX}fluent-forwarder:${draftVersion} .
shell:
	docker run --interactive --tty --rm ${DOCKER_IMAGE_PREFIX}fluent-forwarder:${draftVersion} bash
test:
	$(call run,/fluent-bit/bin/fluent-bit --version)
tag:
	docker tag ${DOCKER_IMAGE_PREFIX}fluent-forwarder:${draftVersion} ${DOCKER_IMAGE_PREFIX}fluent-forwarder:${version}
push:
	docker push ${DOCKER_IMAGE_PREFIX}fluent-forwarder:${version}
release: tag push
