#!/usr/bin/env bash

set -e

if [ "$WEBSERVERTESTER_XDEBUG_ENABLE" == "on" ]
then
  docker-php-ext-enable xdebug
fi

exec "$@"

exit 0
