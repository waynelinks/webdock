FROM php:fpm

ARG INSTALL_XDEBUG="no"

ENV APP_HTTP_AUTH_BASIC="off" \

    APP_AVAILABLE_FRONT_CONTROLLERS="index" \
    APP_DEFAULT_FRONT_CONTROLLER="index" \
    APP_DEBUG_FRONT_CONTROLLERS_ACCESS="off" \

    APP_MARIADB_HOST="127.0.0.1" \
    APP_MARIADB_PORT="3306" \
    APP_MARIADB_USER="" \
    APP_MARIADB_PASSWORD="" \
    APP_MARIADB_DATABASE="" \

    APP_REDIS_HOST="127.0.0.1" \
    APP_REDIS_PORT="6379" \
    APP_REDIS_PASSWORD="" \

    APP_SMTP_HOST="127.0.0.1" \
    APP_SMTP_PORT="25" \
    APP_SMTP_USER="" \
    APP_SMTP_PASSWORD="" \

    APP_STORAGE_ROOT="/application/storage/" \

    APP_XDEBUG_REMOTE_CONNECT_BACK="off" \
    APP_XDEBUG_REMOTE_HOST="127.0.0.1" \
    APP_XDEBUG_REMOTE_PORT="9000" \
    APP_XDEBUG_IDE_KEY="DOCKER"

RUN apt update && apt install --yes \
    cron \
    gettext \
    nginx \
&& pecl install \
    redis \
&& docker-php-ext-install \
    pdo_mysql \
&& docker-php-ext-enable \
    redis \
&& if [ ${INSTALL_XDEBUG} = "yes" ]; then \
    pecl install \
        xdebug \
    && docker-php-ext-enable \
        xdebug \
;fi \
&& service nginx stop

COPY etc/nginx/default.template /etc/nginx/sites-available/default.template
COPY etc/nginx/htpasswd /etc/nginx/htpasswd
COPY etc/php/php.ini /usr/local/etc/php/conf.d/docker-php.ini
COPY etc/php/xdebug.ini /usr/local/etc/php/conf.d/docker-xdebug.ini
COPY etc/crontab /etc/docker-crontab
COPY application/ /application/

RUN chmod 644 /etc/nginx/htpasswd \
&& chmod 644 /usr/local/etc/php/conf.d/docker-php.ini \
&& chmod 644 /usr/local/etc/php/conf.d/docker-xdebug.ini \
&& chmod 644 /etc/docker-crontab \
&& crontab -u www-data /etc/docker-crontab \
&& chmod -R 777 /application/var/

EXPOSE 80

# See "using environment variables in nginx configuration" at https://hub.docker.com/_/nginx/
CMD envsubst '$$APP_HTTP_AUTH_BASIC $$APP_AVAILABLE_FRONT_CONTROLLERS $$APP_DEFAULT_FRONT_CONTROLLER' < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default \
&& nginx \
&& cron \
&& php-fpm
