ARG BASE_IMAGE_NAME
ARG BASE_IMAGE_TAG
FROM $BASE_IMAGE_NAME:$BASE_IMAGE_TAG

ENV API_AVAILABLE_FRONT_CONTROLLERS="index" \
    API_DEFAULT_FRONT_CONTROLLER="index" \
    API_DEBUG_FRONT_CONTROLLERS_ACCESS="off" \
    API_HTTP_AUTH_BASIC="off" \
    API_MYSQL_HOST="127.0.0.1" \
    API_MYSQL_PORT="3306" \
    API_MYSQL_USER="" \
    API_MYSQL_PASSWORD="" \
    API_MYSQL_DATABASE="" \
    API_REDIS_HOST="127.0.0.1" \
    API_REDIS_PORT="6379" \
    API_REDIS_PASSWORD="" \
    API_SMTP_HOST="127.0.0.1" \
    API_SMTP_PORT="25" \
    API_SMTP_USER="" \
    API_SMTP_PASSWORD="" \
    API_XDEBUG_REMOTE_CONNECT_BACK="off" \
    API_XDEBUG_REMOTE_HOST="127.0.0.1" \
    API_XDEBUG_REMOTE_PORT="9000" \
    API_XDEBUG_IDE_KEY="DOCKER"

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
