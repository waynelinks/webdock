#!/usr/bin/env bash

set -e

case $1 in
    "--start")
        envsubst '$$APP_VERSION $$APP_API_ENDPOINT' < /app/public/env.js.template > /app/public/env.js

        envsubst '$$APP_HTTP_AUTH_BASIC' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
        nginx -g 'daemon off;'
    ;;

    *)
        exec "$@"
    ;;
esac
