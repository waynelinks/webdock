#!/usr/bin/env bash

serialize_environment_variables()
{
  export -p | sed 's/declare -x/export/g'
}
substitute_environment_variables()
{
  envsubst $(printenv | cut -f1 -d'=' | sed 's/.*/\\\${&}/' | tr '\n' ',')
}

set -e

if [ "$WEBSERVER_XDEBUG_ENABLE" == "on" ]
then
  docker-php-ext-enable xdebug
fi

echo "$1" > /run/docker-entrypoint-command.txt
case "$1" in
  '--start-migrator')
    su --command "echo 'migrating...'" deploy
  ;;

  '--start-cgi-server')
    php-fpm --nodaemonize
  ;;

  '--start-http-server')
    while [[ "$(REQUEST_METHOD='GET' SCRIPT_FILENAME='/ping' SCRIPT_NAME='/ping' cgi-fcgi -bind -connect "$WEBSERVER_CGI_SERVER_HOST:$WEBSERVER_CGI_SERVER_PORT" 2>/dev/null)" != *pong ]]
    do
      echo "Waiting for CGI server"
      sleep 1
    done

    substitute_environment_variables < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
    nginx -g 'daemon off;'
  ;;

  '--start-task-scheduler')
    serialize_environment_variables > /etc/cronenvs
    crontab /etc/crontab
    cron -f
  ;;

  '--start-example-worker')
    su --command "bin/console.php" deploy
  ;;

  *)
    echo 'undefined' > /run/docker-entrypoint-command.txt
    exec "$@"
  ;;
esac

exit 0
