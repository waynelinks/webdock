#!/usr/bin/make -f

default:
	docker-compose exec --user root ci bash

build:
	docker build --no-cache --tag damlys/webdock-ci:latest .
push:
	docker push damlys/webdock-ci:latest

up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop
