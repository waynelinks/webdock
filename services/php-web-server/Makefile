#!/usr/bin/make -f

# Note:
# `sh -c ""` is a workaround for correct handling of PHP exit codes with Docker.

default: bash

bash:
	docker-compose exec web bash
logs:
	docker-compose logs --tail 25 --follow web
top:
	docker-compose exec web sh -c "htop || apt-get install --yes htop && htop"
install-xdebug:
	docker-compose exec web sh -c "pecl install xdebug; docker-php-ext-enable xdebug"
	docker-compose restart web
	docker-compose exec web chmod a+w /app/xdebug/

build-image:
	docker build --no-cache --tag damlys/webdock-php-web-server:unreleased .
up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop
diff:
	diff .env.dist .env
test:
	docker-compose exec web sh -c "composer run-script test"
