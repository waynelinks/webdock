FROM php:fpm
# php:fpm exposes port 9000

RUN apt-get update

# Install Composer
ARG COMPOSER_CACHE_DIR="/var/cache/composer"
ADD https://getcomposer.org/installer /usr/local/bin/composer-installer
RUN php /usr/local/bin/composer-installer --install-dir=/usr/local/bin --filename=composer \
&& chmod --recursive 777 $COMPOSER_CACHE_DIR \
&& mkdir --parents $COMPOSER_CACHE_DIR \
&& composer config --global cache-dir $COMPOSER_CACHE_DIR
VOLUME $COMPOSER_CACHE_DIR

# Install Cron
RUN apt-get install --yes cron

# Install Nginx
RUN apt-get install --yes \
    gettext \
    nginx \
&& service nginx stop
EXPOSE 80

# Install PHP dependencies
RUN pecl install \
    redis \
&& docker-php-ext-install \
    pdo_mysql \
    opcache \
&& docker-php-ext-enable \
    redis

CMD ["exit", "0"]
