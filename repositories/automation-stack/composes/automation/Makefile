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
	docker-compose exec docker sh -c "docker run --rm hello-world | grep 'Hello'"
	docker-compose exec jenkins sh -c " docker run --rm hello-world | grep 'Hello'"
	docker-compose exec jenkins sh -c " \
		docker image pull hello-world; \
		docker image tag hello-world registry:5000/hello-world; \
		docker image push registry:5000/hello-world; \
		docker image rm registry:5000/hello-world; \
		docker image pull registry:5000/hello-world \
	"

docker-shell:
	docker-compose exec docker ash
jenkins-shell:
	docker-compose exec --user root jenkins bash
registry-shell:
	docker-compose exec registry ash
