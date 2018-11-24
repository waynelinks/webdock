#!/usr/bin/env make

DOCKER_IMAGE_PREFIX=damlys/webdock-
draftVersion=unreleased
version=latest

define run
	$(eval containerName=web-client-$(shell date +%s)-test)
	docker rm --force ${containerName} || true
	docker run \
		--name ${containerName} \
		--detach \
		--rm \
		--mount source=global_npm_cache,target=/var/cache/npm \
		--workdir /opt/app \
		${DOCKER_IMAGE_PREFIX}web-assets-builder:0.0.1-example \
		sleep 600
	docker cp app ${containerName}:/opt
	docker exec ${containerName} sh -c "npm install; $(1)"
	docker stop --time 0 ${containerName}
endef

default: shell

which:
	@echo "${DOCKER_IMAGE_PREFIX}web-client"
build:
	docker build --tag ${DOCKER_IMAGE_PREFIX}web-client:${draftVersion} .
shell:
	docker run --interactive --tty --rm ${DOCKER_IMAGE_PREFIX}web-client:${draftVersion} bash
test:
	$(call run,npm run unit-tests)
tag:
	docker tag ${DOCKER_IMAGE_PREFIX}web-client:${draftVersion} ${DOCKER_IMAGE_PREFIX}web-client:${version}
push:
	docker push ${DOCKER_IMAGE_PREFIX}web-client:${version}
release: tag push
