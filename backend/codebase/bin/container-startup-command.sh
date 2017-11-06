#!/usr/bin/env bash

export BACKEND_VERSION=$(cat /CODEBASE_VERSION)

envsubst '$$BACKEND_HTTP_AUTH_BASIC $$BACKEND_AVAILABLE_FRONT_CONTROLLERS $$BACKEND_DEFAULT_FRONT_CONTROLLER' < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default
nginx

#
# How to load migrations with Symfony migrations as an example:
#
#     php /codebase/bin/console doctrine:migrations:migrate --no-interaction --env=prod --no-debug || true
#

# `php-fpm` must be executed at the end of the command
php-fpm
