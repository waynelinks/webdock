#!/usr/bin/env make

default: run-installation-tests

run-installation-tests:
	docker-compose run --rm this curl --version
	docker-compose run --rm this docker --version
	docker-compose run --rm this git --version
	docker-compose run --rm this jq --version
	docker-compose run --rm this make --version
