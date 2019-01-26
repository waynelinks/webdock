#!/usr/bin/env make

default: run-unit-tests

run-unit-tests:
	docker-compose run --rm this bash -c "composer install && composer run-script unit-tests"
