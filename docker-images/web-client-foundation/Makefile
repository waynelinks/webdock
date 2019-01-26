#!/usr/bin/env make

default: run-installation-tests

run-installation-tests:
	docker-compose run --rm this nginx -v
	docker-compose run --rm this curl --version
	docker-compose run --rm this envsubst --version
