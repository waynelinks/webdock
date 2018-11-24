#!/usr/bin/env make

stackName=webclient

default: assets-builder-shell

setup:
	docker-compose config 2>/dev/null | docker stack deploy --with-registry-auth --compose-file - --prune ${stackName}
state:
	docker stack services ${stackName}

run-unit-tests:
	docker container exec $(shell docker container ls --filter name=${stackName}_assets_builder --quiet) \
		npm run unit-tests
run-web-tests-with-chrome:
	docker container exec $(shell docker container ls --filter name=${stackName}_web_tester --quiet) \
		npm run web-tests-with-chrome
run-web-tests-with-firefox:
	docker container exec $(shell docker container ls --filter name=${stackName}_web_tester --quiet) \
		npm run web-tests-with-firefox
run-web-tests: run-web-tests-with-chrome run-web-tests-with-firefox

assets-builder-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_assets_builder --quiet) bash
http-server-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_http_server --quiet) bash
web-tester-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_web_tester --quiet) bash

fix-mounted-files-permissions:
	-docker container exec $(shell docker container ls --filter name=${stackName}_assets_builder --quiet) \
		chown --recursive $(shell id -u):$(shell id -g) .
	-docker container exec $(shell docker container ls --filter name=${stackName}_web_tester --quiet) \
		chown --recursive $(shell id -u):$(shell id -g) .
