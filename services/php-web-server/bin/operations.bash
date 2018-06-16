#!/usr/bin/env bash

set -e

case $1 in
    '--install-xdebug')
        pecl install xdebug
        docker-php-ext-enable xdebug
        chmod a+w /app/xdebug/
    ;;
esac

exit 0
