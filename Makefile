#!/usr/bin/make -f

include .env

default: dcs.application.enter-bash

#############################
### Docker Compose
#############################

dc.up:
	docker-compose up -d
dc.start:
	docker-compose start
dc.stop:
	docker-compose stop
dc.down:
	docker-compose down

dc.state:
	@echo "\"docker-compose\" command is using \033[44m${COMPOSE_FILE}\033[0m files\n"
	docker-compose ps

dc.rebuild:
	docker-compose stop
	docker-compose rm --force application
	docker-compose build --no-cache
	docker-compose up -d --force-recreate

dc.test:
	@bash ./bin/test.sh

dc.push:
	docker-compose push

dc.update:
	docker-compose pull
	docker-compose up -d

#############################
### Docker Compose services
#############################

dcs.application.enter-bash:
	docker-compose exec application bash

dcs.composer.install-dev:
	docker-compose run --rm composer install --ignore-platform-reqs --no-scripts --dev
dcs.composer.install:
	docker-compose run --rm composer install --ignore-platform-reqs --no-scripts --no-dev

dcs.npm.install-dev:
	docker-compose run --rm node npm install --ignore-scripts
dcs.npm.install:
	docker-compose run --rm node npm install --ignore-scripts --production

dcs.redis.flush:
	docker-compose exec redis redis-cli -a ${REDIS_PASSWORD} flushdb

#############################
### Application
#############################

app.build-dev: dcs.composer.install-dev \
	dcs.npm.install-dev
app.build: dcs.composer.install \
	dcs.npm.install

app.test.unit:
	@echo "..."
app.test.integration:
	@echo "..."
app.test.functional:
	@echo "..."
app.test: app.test.unit app.test.integration app.test.functional
