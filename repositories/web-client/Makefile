#!/usr/bin/env make

default: assets-builder-bash

setup: create-volumes
	docker-compose up -d --remove-orphans
start:
	docker-compose start
stop:
	docker-compose stop
diff:
	diff .env.example .env

assets-builder-bash:
	docker-compose exec assets_builder bash
bash:
	docker-compose exec http_server bash
build-application: create-volumes
	docker run \
		--rm \
		--volume global_npm_cache:/var/cache/npm/ \
		--volume $(shell pwd)/image/app/:/opt/app/ \
		--workdir /opt/app/ \
	damlys/webdock-web-assets-builder:example \
	npm install --unsafe-perm
build-image:
	docker build --no-cache --tag damlys/webdock-web-client:unreleased ./image/
create-volumes:
	docker volume create --name=global_npm_cache
fix-file-permissions:
	docker-compose exec assets_builder chown --recursive $(shell id --user):$(shell id --group) .
logs:
	docker-compose logs --timestamps --tail 25 --follow http_server
