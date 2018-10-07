#!/usr/bin/env make

DOCKER_IMAGE_PREFIX=damlys/webdock-
draftVersion=unreleased
version=latest

define run_assets_builder
	docker run \
		--rm \
		--volume global_npm_cache:/var/cache/npm/ \
		--volume $(shell pwd)/app/:/opt/app/ \
		--workdir /opt/app/ \
		$(2) \
	${DOCKER_IMAGE_PREFIX}web-assets-builder:0.0.1-example \
	$(1)
endef

default: assets-builder-shell

download-packages:
	$(call run_assets_builder,npm install --ignore-scripts)
build-application:
	$(call run_assets_builder,npm install)
run-unit-tests:
	$(call run_assets_builder,npm run unit-tests)
assets-builder-shell:
	$(call run_assets_builder,bash,--interactive --tty)

which:
	@echo "${DOCKER_IMAGE_PREFIX}web-client"
build: download-packages
	docker build --no-cache --tag ${DOCKER_IMAGE_PREFIX}web-client:${draftVersion} .
shell:
	docker run --interactive --tty --rm ${DOCKER_IMAGE_PREFIX}web-client:${draftVersion} bash
tag:
	docker tag ${DOCKER_IMAGE_PREFIX}web-client:${draftVersion} ${DOCKER_IMAGE_PREFIX}web-client:${version}
push:
	docker push ${DOCKER_IMAGE_PREFIX}web-client:${version}
release: tag push

fix-mounted-files-permissions:
	$(call run_assets_builder,chown --recursive $(shell id -u):$(shell id -g) .)
