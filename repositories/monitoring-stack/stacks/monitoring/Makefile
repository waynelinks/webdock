#!/usr/bin/env make

stackName=monitoring

default: state

setup:
	docker-compose config 2>/dev/null | docker stack deploy --with-registry-auth --compose-file - --prune ${stackName}
state:
	docker stack services ${stackName}
