#!/usr/bin/env make

stackName=webserver

default: application-builder-shell

setup:
	docker-compose config 2>/dev/null | docker stack deploy --with-registry-auth --compose-file - --prune ${stackName}
state:
	docker stack services ${stackName}

run-unit-tests:
	docker container exec $(shell docker container ls --filter name=${stackName}_application_builder --quiet) \
		composer unit-tests
run-http-tests:
	docker container exec $(shell docker container ls --filter name=${stackName}_http_tester --quiet) \
		composer http-tests

application-builder-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_application_builder --quiet) bash
cgi-server-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_cgi_server --quiet) bash
http-tester-shell:
	docker container exec -it $(shell docker container ls --filter name=${stackName}_http_tester --quiet) bash

fix-mounted-files-permissions:
	-docker container exec $(shell docker container ls --filter name=${stackName}_application_builder --quiet) \
		chown --recursive $(shell id -u):$(shell id -g) .
	-docker container exec $(shell docker container ls --filter name=${stackName}_http_tester --quiet) \
		chown --recursive $(shell id -u):$(shell id -g) .
install-xdebug:
	docker container exec $(shell docker container ls --filter name=${stackName}_cgi_server --quiet) \
		operation --install-xdebug
	docker container restart $(shell docker container ls --filter name=${stackName}_cgi_server --quiet)
	docker container restart $(shell docker container ls --filter name=${stackName}_http_server --quiet)
