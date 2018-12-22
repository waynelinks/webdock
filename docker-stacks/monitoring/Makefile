#!/usr/bin/env make

stackName=monitoring

default: state

stack:
	(export COMPOSE_PROJECT_NAME=${stackName} && docker-compose --project-name=${stackName} --log-level=ERROR config)
create-local-volumes:
	docker volume create --driver=local --name=${stackName}_mongo_config
	docker volume create --driver=local --name=${stackName}_mongo_data
setup:
	(export COMPOSE_PROJECT_NAME=${stackName} && docker-compose --project-name=${stackName} --log-level=ERROR config) \
	| docker stack deploy --compose-file - --prune --with-registry-auth ${stackName}
state:
	docker stack services ${stackName}
	docker stack ps ${stackName}
