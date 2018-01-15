#!/usr/bin/env bash

set -e

case $1 in
    "--start")
        envsubst '$$APP_HTTP_AUTH_BASIC $$APP_AVAILABLE_FRONT_CONTROLLERS $$APP_DEFAULT_FRONT_CONTROLLER' < /etc/nginx/sites-available/default.conf.template > /etc/nginx/sites-available/default
        nginx

        php-fpm
    ;;

    "--start-cron")
        (printenv | sed 's/^\(.*\)\=\(.*\)$/export \1\=\2/g' | grep -E '^export APP_') > /etc/cron-envvars

        crontab /etc/crontab

        touch /app/var/logs/cron.log
        cron && tail -f /app/var/logs/cron.log
    ;;

    "--install-xdebug")
        pecl install xdebug && docker-php-ext-enable xdebug
    ;;

    *)
        exec "$@"
    ;;
esac
