#!/usr/bin/env bash

set -e

case $(cat /run/docker-entrypoint-command.txt) in
  '--start-http-server')
    if [[ "$(REQUEST_METHOD='GET' SCRIPT_FILENAME='/ping' SCRIPT_NAME='/ping' cgi-fcgi -bind -connect "$WEBSERVER_CGI_SERVER_HOST:$WEBSERVER_CGI_SERVER_PORT" 2>/dev/null)" != *pong ]]
    then
      exit 1
    fi
  ;;

  'undefined')
    exit 1
  ;;
esac

exit 0
