#!/usr/bin/env make

stackName=webclient

default: builder-shell

stack:
	(export COMPOSE_PROJECT_NAME=${stackName} && docker-compose --project-name=${stackName} --log-level=ERROR config)
setup:
	(export COMPOSE_PROJECT_NAME=${stackName} && docker-compose --project-name=${stackName} --log-level=ERROR config) \
	| docker stack deploy --compose-file - --prune --with-registry-auth ${stackName}
state:
	docker stack services ${stackName}
	docker stack ps ${stackName}

run-unit-tests:
	docker container exec $(shell docker container ls --filter name=${stackName}_builder --quiet | head --lines=1) \
		npm run unit-tests
run-web-tests-with-chrome:
	docker container exec $(shell docker container ls --filter name=${stackName}_web_tester --quiet | head --lines=1) \
		npm run web-tests-with-chrome
run-web-tests-with-firefox:
	docker container exec $(shell docker container ls --filter name=${stackName}_web_tester --quiet | head --lines=1) \
		npm run web-tests-with-firefox
run-web-tests: run-web-tests-with-chrome run-web-tests-with-firefox

builder-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_builder --quiet | head --lines=1) bash
http-server-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_http_server --quiet | head --lines=1) bash
web-tester-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_web_tester --quiet | head --lines=1) bash

fix-binded-files-permissions:
	docker container exec $(shell docker container ls --filter name=${stackName}_builder --quiet | head --lines=1) \
		chown --recursive $(shell id -u):$(shell id -g) .
	docker container exec $(shell docker container ls --filter name=${stackName}_web_tester --quiet | head --lines=1) \
		chown --recursive $(shell id -u):$(shell id -g) .
