#!/usr/bin/make -f

# Note:
# `bash -c ""` is a workaround for correct handling of PHP exit codes with Docker.

default: bash

build-image:
	docker build --no-cache --tag damlys/webdock-php-web-server:unreleased .
up:
	docker volume create global_composer_cache
	docker-compose up -d --remove-orphans
start:
	docker-compose start
stop:
	docker-compose stop
status:
	docker-compose ps
dump:
	docker-compose config
diff:
	diff .env.compose .env

build-app:
	docker-compose exec web bash -c "composer install --dev"
bash:
	docker-compose exec web bash
logs:
	docker-compose logs --tail 25 --follow web
processes:
	docker-compose exec web bash -c "htop || apt-get install --yes htop && htop"
install-xdebug:
	docker-compose exec web bash -c "pecl install xdebug; docker-php-ext-enable xdebug"
	docker-compose restart web
	docker-compose exec web chmod a+w /app/xdebug/
