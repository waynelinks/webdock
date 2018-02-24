FROM damlys/webdock-api-foundation:latest

ENV APP_VERSION="undefined" \
    APP_ENVIRONMENT="prod" \
    APP_DEBUG="off" \
    APP_HTTP_AUTH_BASIC="off" \
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

COPY app/ /app/
COPY bin/entrypoint.bash /usr/local/bin/entrypoint
COPY etc/cron/crontab /etc/crontab
COPY etc/nginx/default.template /etc/nginx/sites-available/default.template
COPY etc/nginx/htpasswd /etc/nginx/htpasswd
COPY etc/php/php.ini /usr/local/etc/php/conf.d/zzz-php.ini
COPY etc/php/xdebug.ini /usr/local/etc/php/conf.d/zzz-xdebug.ini

RUN chmod 755 /usr/local/bin/entrypoint \
&& chmod --recursive 777 /app/var/

WORKDIR /app/

ENTRYPOINT ["entrypoint"]

CMD ["--start"]
