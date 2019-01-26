#!/usr/bin/env make

default: state

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

run-integration-tests:
	docker-compose exec docker ash -c "docker container run --rm hello-world | grep 'Hello'"
	docker-compose exec jenkins ash -c "docker container run --rm hello-world | grep 'Hello'"
	docker-compose exec jenkins ash -c " \
		docker image pull hello-world \
		&& docker image tag hello-world registry:5000/hello-world \
		&& docker image push registry:5000/hello-world \
		&& docker image rm registry:5000/hello-world \
		&& docker image pull registry:5000/hello-world \
	"

jenkins-shell:
	docker-compose exec --user root jenkins ash
docker-shell:
	docker-compose exec docker ash
registry-shell:
	docker-compose exec registry ash
