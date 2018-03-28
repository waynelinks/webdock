#!/usr/bin/env bash

set -e

substitute_dockerfile_envs()
{
    envsubst $(printenv | grep '^APP_' | cut -f1 -d'=' | sed 's/.*/\\\${&}/' | tr '\n' ',')
}

case $1 in
    '--start-web')
        substitute_dockerfile_envs < /etc/env.js.template > /app/public/env.js
        substitute_dockerfile_envs < /etc/index.html.template > /app/public/index.html

        substitute_dockerfile_envs < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
        nginx -g 'daemon off;'
    ;;

    *)
        exec "$@"
    ;;
esac
