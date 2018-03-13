FROM damlys/webdock-api-foundation:latest

ENV APP_ENVIRONMENT="prod" \
    APP_DEBUG="off" \
    APP_DEFAULT_CHARSET="UTF-8" \
    APP_DEFAULT_LOCALE="en-US" \
    APP_DEFAULT_TIMEZONE="UTC" \
    APP_VERSION="undefined" \
    APP_NGINX_BASIC_AUTH="off" \
    APP_NGINX_FASTCGI_HOST="127.0.0.1" \
    APP_NGINX_FASTCGI_PORT="9000" \
    APP_NGINX_WORKERS_COUNT="1" \
    APP_PHP_FPM_WORKERS_COUNT="1" \
    APP_PHP_SESSION_DATABASE_ID="1" \
    APP_MYSQL_HOST="127.0.0.1" \
    APP_MYSQL_PORT="3306" \
    APP_MYSQL_USER="" \
    APP_MYSQL_PASSWORD="" \
    APP_MYSQL_DATABASE="" \
    APP_REDIS_HOST="127.0.0.1" \
    APP_REDIS_PORT="6379" \
    APP_REDIS_PASSWORD="" \
    APP_SMTP_HOST="127.0.0.1" \
    APP_SMTP_PORT="25" \
    APP_SMTP_USER="" \
    APP_SMTP_PASSWORD="" \
    APP_XDEBUG_REMOTE_CONNECT_BACK="off" \
    APP_XDEBUG_REMOTE_HOST="127.0.0.1" \
    APP_XDEBUG_REMOTE_PORT="9000" \
    APP_XDEBUG_IDE_KEY="DOCKER"

COPY etc/cron/crontab /etc/crontab
COPY etc/nginx/htpasswd /etc/nginx/htpasswd
COPY etc/nginx/nginx.conf.template /etc/nginx/nginx.conf.template
COPY etc/php/php.ini /usr/local/etc/php/conf.d/zzz-php.ini
COPY etc/php/php-fpm.conf /usr/local/etc/php-fpm.d/zzz-php-fpm.conf
COPY etc/php/xdebug.ini /usr/local/etc/php/conf.d/zzz-xdebug.ini

COPY bin/entrypoint.bash /usr/local/bin/entrypoint
RUN chmod a+x /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["--start-web"]

COPY app/ /app/
WORKDIR /app/
RUN chmod a+x /app/bin/*
