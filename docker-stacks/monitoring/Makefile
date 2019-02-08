#!/usr/bin/env make

include .env

default: state

stack:
	docker-compose --log-level=ERROR config
create-local-volumes:
	docker volume create --driver=local --name=${COMPOSE_PROJECT_NAME}_mongo_config
	docker volume create --driver=local --name=${COMPOSE_PROJECT_NAME}_mongo_data
setup:
	docker-compose --log-level=ERROR config \
	| docker stack deploy --with-registry-auth --compose-file - --prune ${COMPOSE_PROJECT_NAME}
state:
	docker stack services ${COMPOSE_PROJECT_NAME}
	docker stack ps ${COMPOSE_PROJECT_NAME}
