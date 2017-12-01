#!/usr/bin/env bash

case $1 in
    "--start")
        export SPA_VERSION=$(cat /VERSION)

        envsubst '$$SPA_VERSION $$SPA_API_ENDPOINT' < /codebase/public/env.js.template > /codebase/public/env.js

        envsubst '$$SPA_HTTP_AUTH_BASIC' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
        nginx -g 'daemon off;'
    ;;

    *)
        exec "$@"
    ;;
esac
