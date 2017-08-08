#!/usr/bin/make -f

include .env

default: dcs.php.enter-bash

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
dc.purge:
	docker-compose down --volumes --rmi=local

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
	docker-compose stop
	docker-compose rm --force application
	docker-compose up -d

#############################
### Docker Compose services
#############################

dcs.php.enter-bash:
	docker-compose exec php bash

dcs.redis.flush:
	docker-compose exec redis redis-cli -a ${REDIS_PASSWORD} flushdb

#############################
### Application
#############################

app.build-dev: app.composer.install-dev \
	app.npm.install-dev \
	app.set-files-permissions \
	app.execute-database-migrations
app.build: app.composer.install \
	app.npm.install \
	app.set-files-permissions \
	app.execute-database-migrations

app.composer.install-dev:
	docker-compose run --rm composer install --ignore-platform-reqs --no-scripts --dev
app.composer.install:
	docker-compose run --rm composer install --ignore-platform-reqs --no-scripts --no-dev

app.npm.install-dev:
	docker-compose run --rm node npm install --ignore-scripts
app.npm.install:
	docker-compose run --rm node npm install --ignore-scripts --production

app.set-files-permissions: app.storage.set-files-permissions
	docker-compose exec php chmod -R 777 /application/var/
app.storage.set-files-permissions:
	docker-compose exec php chmod -R 777 /storage/

app.execute-database-migrations:
	@echo "..."

app.test.unit:
	@echo "..."
app.test.integration:
	@echo "..."
app.test.functional:
	@echo "..."
app.test: app.test.unit app.test.integration app.test.functional
