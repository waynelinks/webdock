#!/usr/bin/env bash

substitute_environment_variables()
{
    envsubst $(printenv | cut -f1 -d'=' | sed 's/.*/\\\${&}/' | tr '\n' ',')
}

set -e

case $1 in
    '--start-web')
        substitute_environment_variables < /etc/env.js.template > /opt/app/public/env.js
        substitute_environment_variables < /etc/index.html.template > /opt/app/public/index.html

        substitute_environment_variables < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
        htpasswd -b -c /etc/nginx/htpasswd $APP_NGINX_BASIC_AUTH_USER $APP_NGINX_BASIC_AUTH_PASSWORD
        nginx -g 'daemon off;'
    ;;

    *)
        exec "$@"
    ;;
esac

exit 0
