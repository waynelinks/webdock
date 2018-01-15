#!/usr/bin/make -f

default:
	docker-compose exec app bash

build:
	docker build --no-cache --tag damlys/webdock-api:latest .
push:
	docker push damlys/webdock-api:latest

up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop

install-xdebug:
	docker-compose exec app entrypoint --install-xdebug
	docker-compose restart app
