#!/usr/bin/env make

default: builder-shell

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
	docker-compose exec builder \
		npm run unit-tests
	docker-compose exec web_tester \
		npm run unit-tests
run-web-tests-with-chrome:
	docker-compose exec web_tester \
		npm run web-tests-with-chrome
run-web-tests-with-firefox:
	docker-compose exec web_tester \
		npm run web-tests-with-firefox
run-web-tests: run-web-tests-with-chrome run-web-tests-with-firefox

builder-shell:
	docker-compose exec builder bash
http-server-shell:
	docker-compose exec http_server bash
web-tester-shell:
	docker-compose exec web_tester bash

fix-binded-files-permissions:
	docker-compose exec builder \
		chown --recursive $(shell id -u):$(shell id -g) .
	docker-compose exec web_tester \
		chown --recursive $(shell id -u):$(shell id -g) .
