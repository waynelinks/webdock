#!/usr/bin/env make

DOCKER_IMAGE_PREFIX=damlys/webdock-
draftVersion=unreleased
version=latest

define run_application_builder
	docker run \
		--rm \
		--volume global_composer_cache:/var/cache/composer/ \
		--volume $(shell pwd)/app/:/opt/app/ \
		--workdir /opt/app/ \
		$(2) \
	${DOCKER_IMAGE_PREFIX}php-web-server-foundation:0.0.1-example \
	$(1)
endef

default: application-builder-shell

download-packages:
	$(call run_application_builder,composer install --no-interaction --no-autoloader --no-scripts)
build-appilcation:
	$(call run_application_builder,composer install --no-interaction)
run-unit-tests:
	$(call run_application_builder,composer unit-tests)
application-builder-shell:
	$(call run_application_builder,bash,--interactive --tty)

build: download-packages
	docker build --no-cache --tag ${DOCKER_IMAGE_PREFIX}php-web-server-tester:${draftVersion} .
shell:
	docker run --interactive --tty --rm ${DOCKER_IMAGE_PREFIX}php-web-server-tester:${draftVersion} bash
tag:
	docker tag ${DOCKER_IMAGE_PREFIX}php-web-server-tester:${draftVersion} ${DOCKER_IMAGE_PREFIX}php-web-server-tester:${version}
push:
	docker push ${DOCKER_IMAGE_PREFIX}php-web-server-tester:${version}
release: tag push

fix-mounted-files-permissions:
	$(call run_application_builder,chown --recursive $(shell id -u):$(shell id -g) .)
