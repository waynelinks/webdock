FROM php:fpm

ENV BACKEND_VERSION="N/A" \

    BACKEND_AVAILABLE_FRONT_CONTROLLERS="index" \
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

RUN apt-get update && apt-get install --yes \
    cron \
    gettext \
    nginx \
&& pecl install \
    redis \
&& docker-php-ext-install \
    pdo_mysql \
&& docker-php-ext-enable \
    redis \
# Install Composer
&& php -r "copy('https://getcomposer.org/installer', '/root/composer-setup.php');" \
&& php /root/composer-setup.php --install-dir=/usr/local/bin --filename=composer \
# Apt starts nginx after installation
&& service nginx stop

COPY VERSION /CODEBASE_VERSION
COPY codebase/ /codebase/
COPY etc/nginx/default.template /etc/nginx/sites-available/default.template
COPY etc/nginx/htpasswd /etc/nginx/htpasswd
COPY etc/php/php.ini /usr/local/etc/php/conf.d/zzz-php.ini
COPY etc/php/xdebug.ini /usr/local/etc/php/conf.d/zzz-xdebug.ini
COPY etc/cron/crontab /etc/crontab

RUN chmod 644 /CODEBASE_VERSION \
&& chmod 644 /etc/nginx/sites-available/default.template \
&& chmod 644 /etc/nginx/htpasswd \
&& chmod 644 /usr/local/etc/php/conf.d/zzz-php.ini \
&& chmod 644 /usr/local/etc/php/conf.d/zzz-xdebug.ini \
&& chmod 644 /etc/crontab \
&& chmod -R 777 /codebase/var/

# Port 9000 is exposed by php:~fpm image
EXPOSE 80

WORKDIR /codebase/

CMD sh -c "/codebase/bin/container-startup-command.sh"
