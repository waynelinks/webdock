#!/usr/bin/env bash

set -e

substitute_dockerfile_envs()
{
    envsubst $(printenv | grep '^APP_' | cut -f1 -d'=' | sed 's/.*/\\\${&}/' | tr '\n' ',')
}

case $1 in
    '--start-cron')
        (printenv | grep '^APP_') > /etc/cronenvs
        crontab /etc/crontab
        cron -f
    ;;

    '--start-fpm')
        php-fpm --nodaemonize
    ;;

    '--start-nginx')
        export APP_NGINX_LOGGABLE='1'
        substitute_dockerfile_envs < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
        nginx -g 'daemon off;'
    ;;

    '--start-web')
        export APP_NGINX_LOGGABLE='0'
        substitute_dockerfile_envs < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
        nginx -g 'daemon on;'

        php-fpm --nodaemonize
    ;;

    *)
        exec "$@"
    ;;
esac
