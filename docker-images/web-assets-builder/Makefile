#!/usr/bin/env make

default: run-installation-tests

run-installation-tests:
	docker-compose run --rm this node --version
	docker-compose run --rm this npm --version
	docker-compose run --rm this git --version
	docker-compose run --rm this sass --version
	docker-compose run --rm this tsc --version
	docker-compose run --rm this webpack --version
	docker-compose run --rm this webpack-cli --version
