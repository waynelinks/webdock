#!/usr/bin/env make

default: state

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

run-integration-tests:
	docker-compose exec dind docker run --rm hello-world
	docker-compose exec jenkins docker run --rm hello-world

dind-shell:
	docker-compose exec dind ash
jenkins-shell:
	docker-compose exec --user root jenkins bash
