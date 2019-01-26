#!/usr/bin/env make

default: run-installation-tests

run-installation-tests:
	docker-compose run --rm this php --version
	docker-compose run --rm this bash -c " \
		php -m | grep 'Xdebug'; \
		if [ $$? == 1 ]; then echo '[ERROR] Xdebug is enabled by default.'; exit 1; else echo '[OK] Xdebug is disabled by default.'; fi; \
	"
	docker-compose run --rm this bash -c " \
		docker-php-ext-enable xdebug; \
		php -m | grep 'Xdebug'; \
		if [ $$? == 0 ]; then echo '[OK] Xdebug can be enabled.'; else echo '[ERROR] Xdebug can not be enabled.'; exit 1; fi; \
	"
	docker-compose run --rm this php-fpm --version
	docker-compose run --rm this pecl version
	docker-compose run --rm this composer --version
	docker-compose run --rm this curl --version
	docker-compose run --rm this dpkg --status cron | grep 'Version'
	docker-compose run --rm this envsubst --version
	docker-compose run --rm this git --version
	docker-compose run --rm this nginx -v
	docker-compose run --rm this which cgi-fcgi
	docker-compose run --rm this which cron
	docker-compose run --rm this which crontab
