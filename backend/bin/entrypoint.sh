#!/usr/bin/env bash

pre_start()
{
    export BACKEND_VERSION=$(cat /VERSION)
}

post_start()
{
    sleep 1
    #
    # This is good moment to execute database migrations eg. like this:
    #
    #     php /codebase/bin/console doctrine:migrations:migrate --no-interaction --env=prod --no-debug || true
    #
    # The ` || true` suffix ensures that container will start even without database connection,
    # be aware of that migrations may not be executed.
    #
}

case $1 in
    "--start")
        pre_start

        envsubst '$$BACKEND_HTTP_AUTH_BASIC $$BACKEND_AVAILABLE_FRONT_CONTROLLERS $$BACKEND_DEFAULT_FRONT_CONTROLLER' < /etc/nginx/sites-available/default.conf.template > /etc/nginx/sites-available/default
        nginx

        php-fpm

        post_start
    ;;

    "--start-cron")
        pre_start

        (printenv | sed 's/^\(.*\)\=\(.*\)$/export \1\=\2/g' | grep -E '^export BACKEND_') > /etc/cron-envvars

        crontab /etc/crontab

        touch /codebase/var/logs/cron.log
        cron && tail -f /codebase/var/logs/cron.log

        post_start
    ;;

    *)
        exec "$@"
    ;;
esac
