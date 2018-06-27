#!/usr/bin/env bash

set -e

case "$(cat /run/docker-entrypoint-command.txt)" in
    '--start-http-server')
        curl --head --silent --fail "$APP_API_GATEWAY_DSN" || exit 1
    ;;

    'undefined')
        exit 1
    ;;
esac

exit 0
