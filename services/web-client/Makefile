#!/usr/bin/make -f

default: assets_builder

bash:
	docker-compose exec web bash
logs:
	docker-compose logs --tail 25 --follow web
assets_builder:
	docker-compose exec assets_builder bash

build-image:
	docker build --no-cache --tag damlys/webdock-web-client:unreleased .
up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop
diff:
	diff .env.dist .env
test:
	docker-compose exec assets_builder npm run test
