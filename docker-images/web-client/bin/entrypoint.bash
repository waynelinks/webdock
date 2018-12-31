#!/usr/bin/env bash

substitute_environment_variables()
{
  envsubst $(printenv | cut -f1 -d'=' | sed 's/.*/\\\${&}/' | tr '\n' ',')
}

set -e

echo "$1" > /run/docker-entrypoint-command.txt
case "$1" in
  '--start-http-server')
    substitute_environment_variables < /etc/opt/app/config.json.template > /opt/app/public/config.json
    substitute_environment_variables < /etc/opt/app/index.html.template > /opt/app/public/index.html

    substitute_environment_variables < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
    nginx -g 'daemon off;'
  ;;

  *)
    echo 'undefined' > /run/docker-entrypoint-command.txt
    exec "$@"
  ;;
esac

exit 0
