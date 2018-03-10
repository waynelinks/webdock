#!/usr/bin/make -f

node:
	docker-compose exec node bash
bash:
	docker-compose exec app_web bash
logs:
	docker-compose logs --tail 25 --follow app_web

up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop
diff:
	diff .env.dist .env
