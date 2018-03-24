#!/usr/bin/make -f

bash:
	docker-compose exec app_web bash
logs:
	docker-compose logs --tail 25 --follow app_web
top:
	docker-compose exec app_web sh -c "htop || apt-get install --yes htop && htop"
install-xdebug:
	docker-compose exec app_web sh -c "pecl install xdebug; docker-php-ext-enable xdebug"
	docker-compose restart app_web
	docker-compose exec app_web chmod a+w /app/xdebug/

build:
	docker build --no-cache --tag damlys/webdock-api:unreleased .
up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop
diff:
	diff .env.dist .env
