#!/usr/bin/env make

default: assets-builder-shell

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
	docker-compose exec assets_builder npm run unit-tests
run-web-tests-with-chrome:
	docker-compose exec web_tester npm run web-tests-with-chrome
run-web-tests-with-firefox:
	docker-compose exec web_tester npm run web-tests-with-firefox
run-web-tests: run-web-tests-with-chrome run-web-tests-with-firefox

assets-builder-shell:
	docker-compose exec assets_builder bash
http-server-shell:
	docker-compose exec http_server bash
web-tester-shell:
	docker-compose exec web_tester bash

fix-mounted-files-permissions:
	-docker-compose exec assets_builder chown --recursive $(shell id -u):$(shell id -g) .
	-docker-compose exec web_tester chown --recursive $(shell id -u):$(shell id -g) .
