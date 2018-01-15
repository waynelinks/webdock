#!/usr/bin/make -f

default:
	docker-compose exec node bash

build:
	docker build --no-cache --tag damlys/webdock-spa:latest .
push:
	docker push damlys/webdock-spa:latest

up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop
