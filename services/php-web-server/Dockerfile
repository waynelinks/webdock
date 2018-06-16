FROM damlys/webdock-php-web-server-foundation:example

ENV APP_VERSION="undefined" \
    APP_ENVIRONMENT="prod" \
    APP_DEBUG="off" \
    APP_NGINX_BASIC_AUTH="off" \
    APP_NGINX_BASIC_AUTH_USER="demo" \
    APP_NGINX_BASIC_AUTH_PASSWORD="secret" \
    APP_NGINX_LOGGABLE="0" \
    APP_NGINX_CGI_AUTHORITY="127.0.0.1:9000" \
    APP_NGINX_WORKERS_COUNT="2" \
    APP_PHP_FPM_WORKERS_COUNT="4" \
    APP_DEFAULT_CHARSET="UTF-8" \
    APP_DEFAULT_LOCALE="en-US" \
    APP_DEFAULT_TIMEZONE="UTC" \
    APP_CACHE_STORAGE_DSN="redis://127.0.0.1:6379?auth=password&database=2" \
    APP_DATA_STORAGE_DSN="mysql://username:password@127.0.0.1:3306/dbname" \
    APP_FILE_STORAGE_DSN="http://accesskey:secretkey@127.0.0.1/" \
    APP_LOG_STORAGE_DSN="redis://127.0.0.1:6379?auth=password&database=0" \
    APP_MAIL_SENDER_URI="smtp://username:password@127.0.0.1:587/" \
    APP_MESSAGE_QUEUE_DSN="amqp://username:password@127.0.0.1:5672/" \
    APP_SESSION_STORAGE_DSN="redis://127.0.0.1:6379?auth=password&database=1" \
    APP_XDEBUG_REMOTE_AUTOSTART="off" \
    APP_XDEBUG_REMOTE_CONNECT_BACK="off" \
    APP_XDEBUG_REMOTE_HOST="127.0.0.1" \
    APP_XDEBUG_REMOTE_PORT="9000" \
    APP_XDEBUG_IDE_KEY="DOCKER"

COPY etc/cron/crontab /etc/crontab
COPY etc/nginx/nginx.conf.template /etc/nginx/nginx.conf.template
COPY etc/php/php.ini /usr/local/etc/php/conf.d/zzz-php.ini
COPY etc/php/php-fpm.conf /usr/local/etc/php-fpm.d/zzz-php-fpm.conf
COPY etc/php/xdebug.ini /usr/local/etc/php/conf.d/zzz-xdebug.ini

COPY bin/entrypoint.bash /usr/local/bin/entrypoint
RUN chmod a+x /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["--start-web"]

COPY bin/healthcheck.bash /usr/local/bin/healthcheck
RUN chmod a+x /usr/local/bin/healthcheck
HEALTHCHECK --timeout=3s CMD ["healthcheck"]

COPY bin/operations.bash /usr/local/bin/operations
RUN chmod a+x /usr/local/bin/operations

COPY app/ /app/
WORKDIR /app/
RUN chmod a+x /app/bin/*
