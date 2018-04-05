#!/usr/bin/make -f

default: assets-builder-bash

build-image:
	docker build --no-cache --tag damlys/webdock-web-client:unreleased .
up:
	docker volume create global_npm_cache
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
	docker-compose exec assets_builder npm install
	docker-compose exec assets_builder npm run build
bash:
	docker-compose exec web bash
logs:
	docker-compose logs --tail 25 --follow web
assets-builder-bash:
	docker-compose exec assets_builder bash
