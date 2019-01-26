#!/usr/bin/env make

default: cgi-server-shell

stack:
	docker-compose config
setup:
	docker-compose up --detach --remove-orphans
stop:
	docker-compose stop
start:
	docker-compose start
state:
	docker-compose ps
logs:
	docker-compose logs --timestamps --tail 25 --follow

run-unit-tests:
	docker-compose exec cgi_server \
		composer run-script unit-tests
	docker-compose exec http_tester \
		composer run-script unit-tests
run-http-tests:
	docker-compose exec http_tester \
		composer run-script http-tests

cgi-server-shell:
	docker-compose exec cgi_server bash
http-tester-shell:
	docker-compose exec http_tester bash

fix-binded-files-permissions:
	docker-compose exec cgi_server \
		chown --recursive $(shell id -u):$(shell id -g) .
	docker-compose exec http_tester \
		chown --recursive $(shell id -u):$(shell id -g) .
