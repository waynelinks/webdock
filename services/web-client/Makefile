#!/usr/bin/env make

default: assets-builder-bash

build-image:
	docker build --no-cache --tag damlys/webdock-web-client:unreleased .
up:
	docker volume create --name=global_npm_cache
	docker-compose up -d --remove-orphans
start:
	docker-compose start
stop:
	docker-compose stop
status:
	docker-compose ps
dump:
	docker-compose config
diff:
	diff .env.compose .env

build-app:
	docker-compose exec assets_builder npm install --unsafe-perm
bash:
	docker-compose exec web bash
watch-logs:
	docker-compose logs --tail 25 --follow web
assets-builder-bash:
	docker-compose exec assets_builder bash
