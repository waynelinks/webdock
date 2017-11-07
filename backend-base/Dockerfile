FROM php:fpm

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
&& php -r "copy('https://getcomposer.org/installer', '/root/composer-setup.php');" \
&& php /root/composer-setup.php --install-dir=/usr/local/bin --filename=composer \
&& service nginx stop

COPY VERSION /VERSION

EXPOSE 80
# Port 9000 is exposed by php:~fpm image

CMD exit 0
