#!/usr/bin/make -f

default:
	docker-compose exec app bash

up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop

install-xdebug:
	docker-compose exec app sh -c "pecl install xdebug && docker-php-ext-enable xdebug"
	docker-compose restart app
