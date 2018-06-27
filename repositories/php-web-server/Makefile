#!/usr/bin/env make

# Note:
# `bash -c ""` is a workaround for correct handling of PHP exit codes with Docker.

default: bash

setup: create-volumes
	docker-compose up -d --remove-orphans
start:
	docker-compose start
stop:
	docker-compose stop
diff:
	diff .env.example .env

bash:
	docker-compose exec cgi_server bash
build-application: create-volumes
	docker run \
		--rm \
		--volume global_composer_cache:/var/cache/composer/ \
		--volume $(shell pwd)/image/app/:/opt/app/ \
		--workdir /opt/app/ \
	damlys/webdock-php-web-server-foundation:example \
	bash -c "composer install"
build-image:
	docker build --no-cache --tag damlys/webdock-php-web-server:unreleased ./image/
create-volumes:
	docker volume create --name=global_composer_cache
fix-file-permissions:
	docker-compose exec cgi_server chown --recursive $(shell id --user):$(shell id --group) .
install-xdebug:
	docker-compose exec cgi_server operation --install-xdebug
	docker-compose restart cgi_server
	docker-compose restart http_server
logs:
	docker-compose logs --timestamps --tail 25 --follow cgi_server http_server task_scheduler example_worker
migrate:
	docker-compose exec cgi_server operation --migrate
