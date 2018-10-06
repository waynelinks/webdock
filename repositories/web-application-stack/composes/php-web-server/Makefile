#!/usr/bin/env make

default: cgi-server-shell

setup:
	docker-compose up -d --remove-orphans
start:
	docker-compose start
stop:
	docker-compose stop
state:
	docker-compose ps
logs:
	docker-compose logs --timestamps --tail 25 --follow

run-unit-tests:
	docker-compose exec application_builder composer unit-tests
run-http-tests:
	docker-compose exec http_tester composer http-tests

application-builder-shell:
	docker-compose exec application_builder bash
cgi-server-shell:
	docker-compose exec cgi_server bash
http-tester-shell:
	docker-compose exec http_tester bash

fix-mounted-files-permissions:
	-docker-compose exec application_builder chown --recursive $(shell id -u):$(shell id -g) .
	-docker-compose exec http_tester chown --recursive $(shell id -u):$(shell id -g) .
install-xdebug:
	docker-compose exec cgi_server operation --install-xdebug
	docker-compose restart cgi_server
	docker-compose restart http_server
