ARG BASE_IMAGE_NAME
ARG BASE_IMAGE_TAG
FROM $BASE_IMAGE_NAME:$BASE_IMAGE_TAG

ENV BACKEND_AVAILABLE_FRONT_CONTROLLERS="index" \
    BACKEND_DEFAULT_FRONT_CONTROLLER="index" \
    BACKEND_DEBUG_FRONT_CONTROLLERS_ACCESS="off" \
    BACKEND_HTTP_AUTH_BASIC="off" \
    BACKEND_MYSQL_HOST="127.0.0.1" \
    BACKEND_MYSQL_PORT="3306" \
    BACKEND_MYSQL_USER="" \
    BACKEND_MYSQL_PASSWORD="" \
    BACKEND_MYSQL_DATABASE="" \
    BACKEND_REDIS_HOST="127.0.0.1" \
    BACKEND_REDIS_PORT="6379" \
    BACKEND_REDIS_PASSWORD="" \
    BACKEND_SMTP_HOST="127.0.0.1" \
    BACKEND_SMTP_PORT="25" \
    BACKEND_SMTP_USER="" \
    BACKEND_SMTP_PASSWORD="" \
    BACKEND_XDEBUG_REMOTE_CONNECT_BACK="off" \
    BACKEND_XDEBUG_REMOTE_HOST="127.0.0.1" \
    BACKEND_XDEBUG_REMOTE_PORT="9000" \
    BACKEND_XDEBUG_IDE_KEY="DOCKER"

COPY VERSION /VERSION
COPY codebase/ /codebase/
COPY bin/entrypoint.bash /usr/local/bin/docker-entrypoint
COPY etc/cron/crontab /etc/crontab
COPY etc/nginx/default.conf.template /etc/nginx/sites-available/default.conf.template
COPY etc/nginx/htpasswd /etc/nginx/htpasswd
COPY etc/php/php.ini /usr/local/etc/php/conf.d/zzz-php.ini
COPY etc/php/xdebug.ini /usr/local/etc/php/conf.d/zzz-xdebug.ini

RUN chmod 644 /VERSION \
&& chmod -R 777 /codebase/var/ \
&& chmod 755 /usr/local/bin/docker-entrypoint \
&& chmod 644 /etc/crontab \
&& chmod 644 /etc/nginx/sites-available/default.conf.template \
&& chmod 644 /etc/nginx/htpasswd \
&& chmod 644 /usr/local/etc/php/conf.d/zzz-php.ini \
&& chmod 644 /usr/local/etc/php/conf.d/zzz-xdebug.ini

WORKDIR /codebase/

ENTRYPOINT ["docker-entrypoint"]

CMD ["--start"]
