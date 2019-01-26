#!/usr/bin/env make

default: run-installation-tests

run-installation-tests:
	docker-compose run --rm this curl --version
	docker-compose run --rm this docker --version
	docker-compose run --rm this docker-compose --version
	docker-compose run --rm this git --version
	docker-compose run --rm this helm version --client --short
	docker-compose run --rm this jq --version
	docker-compose run --rm this kubectl version --client --short
	docker-compose run --rm this make --version
	docker-compose run --rm this notary version
	docker-compose run --rm this vault --version
