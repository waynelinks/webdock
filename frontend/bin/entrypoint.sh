#!/usr/bin/env bash

case $1 in
    "--start")
        export FRONTEND_VERSION=$(cat /VERSION)

        envsubst '$$FRONTEND_VERSION $$FRONTEND_SERVER_ENDPOINT' < /codebase/public/env.js.template > /codebase/public/env.js

        envsubst '$$FRONTEND_HTTP_AUTH_BASIC' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
        nginx -g 'daemon off;'
    ;;

    *)
        exec "$@"
    ;;
esac
