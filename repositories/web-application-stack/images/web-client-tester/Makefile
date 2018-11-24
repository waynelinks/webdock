#!/usr/bin/env make

DOCKER_IMAGE_PREFIX=damlys/webdock-
draftVersion=unreleased
version=latest

define run
	docker run \
		--rm \
		--mount source=global_npm_cache,target=/var/cache/npm \
		${DOCKER_IMAGE_PREFIX}web-client-tester:${draftVersion} \
		sh -c "npm install; $(1)"
endef

default: shell

which:
	@echo "${DOCKER_IMAGE_PREFIX}web-client-tester"
build:
	docker build --tag ${DOCKER_IMAGE_PREFIX}web-client-tester:${draftVersion} .
shell:
	docker run --interactive --tty --rm ${DOCKER_IMAGE_PREFIX}web-client-tester:${draftVersion} bash
test:
	$(call run,npm run unit-tests)
tag:
	docker tag ${DOCKER_IMAGE_PREFIX}web-client-tester:${draftVersion} ${DOCKER_IMAGE_PREFIX}web-client-tester:${version}
push:
	docker push ${DOCKER_IMAGE_PREFIX}web-client-tester:${version}
release: tag push
