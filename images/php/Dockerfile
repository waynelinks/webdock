FROM php:fpm

ARG INSTALL_XDEBUG="no"

ENV PHP_DEBUG_FRONT_CONTROLLERS_ACCESS="off" \
    XDEBUG_REMOTE_CONNECT_BACK="off" \
    XDEBUG_REMOTE_HOST="127.0.0.1" \
    XDEBUG_REMOTE_PORT="9000" \
    XDEBUG_IDE_KEY="DOCKER"

COPY php.ini /usr/local/etc/php/conf.d/docker-php.ini
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-xdebug.ini
COPY crontab /etc/docker-crontab

RUN apt-get update && apt-get install --yes \
    cron \
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
&& chmod 644 /usr/local/etc/php/conf.d/docker-php.ini \
&& chmod 644 /usr/local/etc/php/conf.d/docker-xdebug.ini \
&& chmod 644 /etc/docker-crontab \
&& crontab -u www-data /etc/docker-crontab

CMD ["/bin/bash", "-c", "cron && php-fpm"]
