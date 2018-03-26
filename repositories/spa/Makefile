#!/usr/bin/make -f

default: node

bash:
	docker-compose exec app_web bash
logs:
	docker-compose logs --tail 25 --follow app_web
node:
	docker-compose exec node bash

build:
	docker build --no-cache --tag damlys/webdock-spa:unreleased .
up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop
diff:
	diff .env.dist .env
