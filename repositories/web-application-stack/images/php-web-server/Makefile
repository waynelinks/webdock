#!/usr/bin/env make

DOCKER_IMAGE_PREFIX=damlys/webdock-
draftVersion=unreleased
version=latest

define run
	docker run \
		--rm \
		--mount source=global_composer_cache,target=/var/cache/composer \
		${DOCKER_IMAGE_PREFIX}php-web-server:${draftVersion} \
		sh -c "composer install --no-interaction --no-ansi; $(1)"
endef

default: shell

which:
	@echo "${DOCKER_IMAGE_PREFIX}php-web-server"
build:
	docker build --tag ${DOCKER_IMAGE_PREFIX}php-web-server:${draftVersion} .
shell:
	docker run --interactive --tty --rm ${DOCKER_IMAGE_PREFIX}php-web-server:${draftVersion} bash
test:
	$(call run,composer run-script unit-tests)
tag:
	docker tag ${DOCKER_IMAGE_PREFIX}php-web-server:${draftVersion} ${DOCKER_IMAGE_PREFIX}php-web-server:${version}
push:
	docker push ${DOCKER_IMAGE_PREFIX}php-web-server:${version}
release: tag push
