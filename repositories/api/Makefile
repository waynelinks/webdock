#!/usr/bin/make -f

bash:
	docker-compose exec app_web bash
logs:
	docker-compose logs --tail 25 --follow app_web
top:
	docker-compose exec app_web sh -c "htop || apt install -y htop && htop"

up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop
diff:
	diff .env.dist .env

install-xdebug:
	docker-compose exec app_web sh -c "pecl install xdebug; docker-php-ext-enable xdebug"
	docker-compose restart app_web
