FROM php:fpm

ARG COMPOSER_CACHE_DIR="/var/cache/composer"

RUN apt-get update

# Install PHP dependencies
RUN apt-get install --yes \
    gettext \
&& pecl install \
    redis \
&& docker-php-ext-install \
    pdo_mysql \
&& docker-php-ext-enable \
    redis

# Install Composer
ADD https://getcomposer.org/installer /usr/local/bin/composer-installer
RUN php /usr/local/bin/composer-installer --install-dir=/usr/local/bin --filename=composer

RUN mkdir --parents $COMPOSER_CACHE_DIR \
&& chmod --recursive 777 $COMPOSER_CACHE_DIR \
&& composer config --global cache-dir $COMPOSER_CACHE_DIR

# Install Cron
RUN apt-get install --yes \
    cron

# Install Nginx
RUN apt-get install --yes \
    nginx \
&& service nginx stop

EXPOSE 80
# Port 9000 is exposed by php:fpm image

VOLUME $COMPOSER_CACHE_DIR

CMD ["exit", "0"]
