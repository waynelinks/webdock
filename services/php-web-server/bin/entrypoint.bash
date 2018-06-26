#!/usr/bin/env bash

print_environment_variables()
{
    export -p | sed 's/declare -x/export/g'
}
substitute_environment_variables()
{
    envsubst $(printenv | cut -f1 -d'=' | sed 's/.*/\\\${&}/' | tr '\n' ',')
}

set -e

if [ "$APP_DEBUG" == "off" ]
then
    composer run-script migrate
fi

echo $1 > /etc/docker_entrypoint_argument
case $1 in
    '--start-cron')
        print_environment_variables > /etc/cronenvs
        crontab /etc/crontab
        cron -f
    ;;

#    '--start-fpm')
#        php-fpm --nodaemonize
#    ;;
#
#    '--start-nginx')
#        substitute_environment_variables < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
#        htpasswd -b -c /etc/nginx/htpasswd $APP_NGINX_BASIC_AUTH_USER $APP_NGINX_BASIC_AUTH_PASSWORD
#        nginx -g 'daemon off;'
#    ;;

    '--start-web')
        substitute_environment_variables < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
        htpasswd -b -c /etc/nginx/htpasswd $APP_NGINX_BASIC_AUTH_USER $APP_NGINX_BASIC_AUTH_PASSWORD
        nginx -g 'daemon on;'

        php-fpm --nodaemonize
    ;;

    *)
        echo "unrecognized: $@" > /etc/docker_entrypoint_argument
        exec "$@"
    ;;
esac

exit 0
