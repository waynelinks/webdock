#!/usr/bin/env bash

substitute_dockerfile_envs()
{
    envsubst $(printenv | grep '^APP_' | cut -f1 -d'=' | sed 's/.*/\\\${&}/' | tr '\n' ',')
}

set -e

export ENTRYPOINT_ARGUMENT=$1
case $ENTRYPOINT_ARGUMENT in
    '--start-web')
        substitute_dockerfile_envs < /etc/env.js.template > /app/public/env.js
        substitute_dockerfile_envs < /etc/index.html.template > /app/public/index.html

        substitute_dockerfile_envs < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
        htpasswd -b -c /etc/nginx/htpasswd $APP_NGINX_BASIC_AUTH_USER $APP_NGINX_BASIC_AUTH_PASSWORD
        nginx -g 'daemon off;'
    ;;

    *)
        export ENTRYPOINT_ARGUMENT="unrecognized: $@"
        exec "$@"
    ;;
esac

exit 0
