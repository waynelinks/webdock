#!/usr/bin/env make

default: run-unit-tests

run-unit-tests:
	docker-compose run --rm builder bash -c "npm install && npm run unit-tests"
