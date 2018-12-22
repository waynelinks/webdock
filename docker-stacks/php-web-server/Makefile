#!/usr/bin/env make

stackName=webserver

default: cgi-server-shell

stack:
	(export COMPOSE_PROJECT_NAME=${stackName} && docker-compose --project-name=${stackName} --log-level=ERROR config)
create-local-volumes:
	docker volume create --driver=local --name=${stackName}_minio_data
	docker volume create --driver=local --name=${stackName}_mongo_config
	docker volume create --driver=local --name=${stackName}_mongo_data
	docker volume create --driver=local --name=${stackName}_mysql_data
	docker volume create --driver=local --name=${stackName}_postgres_data
	docker volume create --driver=local --name=${stackName}_rabbitmq_data
	docker volume create --driver=local --name=${stackName}_redis_data
	docker volume create --driver=local --name=${stackName}_pgadmin_config
setup:
	(export COMPOSE_PROJECT_NAME=${stackName} && docker-compose --project-name=${stackName} --log-level=ERROR config) \
	| docker stack deploy --compose-file - --prune --with-registry-auth ${stackName}
state:
	docker stack services ${stackName}
	docker stack ps ${stackName}

run-unit-tests:
	docker container exec $(shell docker container ls --filter name=${stackName}_cgi_server --quiet | head --lines=1) \
		composer unit-tests
run-http-tests:
	docker container exec $(shell docker container ls --filter name=${stackName}_http_tester --quiet | head --lines=1) \
		composer http-tests

cgi-server-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_cgi_server --quiet | head --lines=1) bash
http-tester-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_http_tester --quiet | head --lines=1) bash

fix-binded-files-permissions:
	docker container exec $(shell docker container ls --filter name=${stackName}_cgi_server --quiet | head --lines=1) \
		chown --recursive $(shell id -u):$(shell id -g) .
	docker container exec $(shell docker container ls --filter name=${stackName}_http_tester --quiet | head --lines=1) \
		chown --recursive $(shell id -u):$(shell id -g) .
