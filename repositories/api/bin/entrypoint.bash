#!/usr/bin/env bash

set -e

case $1 in
    "--start")
        envsubst '$$APP_HTTP_AUTH_BASIC' < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default
        nginx -g 'daemon on;'

        php-fpm --nodaemonize
    ;;

    "--start-cron")
        (printenv | sed 's/^\(.*\)\=\(.*\)$/export \1\=\2/g' | grep -E '^export APP_') > /etc/cron-envvars
        crontab /etc/crontab
        cron -f
    ;;

    *)
        exec "$@"
    ;;
esac
