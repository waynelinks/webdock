#!/usr/bin/env bash

set -e

case $1 in
    "--start")
        envsubst '$$APP_HTTP_AUTH_BASIC' < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default
        nginx

        php-fpm
    ;;

    "--start-cron")
        (printenv | sed 's/^\(.*\)\=\(.*\)$/export \1\=\2/g' | grep -E '^export APP_') > /etc/cron-envvars

        crontab /etc/crontab

        cron -f
    ;;

    "--install-xdebug")
        pecl install xdebug && docker-php-ext-enable xdebug
    ;;

    *)
        exec "$@"
    ;;
esac
