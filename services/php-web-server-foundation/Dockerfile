FROM php:fpm
# php:~fpm exposes port 9000

RUN apt-get update

# Install Cron
RUN apt-get install --yes \
    cron \
&& apt-get clean

# Install Git
RUN apt-get install --yes \
    git \
&& apt-get clean

# Install Nginx
RUN apt-get install --yes \
    apache2-utils \
    gettext \
    nginx \
&& apt-get clean \
&& service nginx stop
EXPOSE 80

# Install Composer
ADD https://getcomposer.org/installer /usr/local/bin/composer-installer
RUN php /usr/local/bin/composer-installer --install-dir=/usr/local/bin --filename=composer

ARG COMPOSER_CACHE_DIR="/var/cache/composer"
RUN mkdir --parents $COMPOSER_CACHE_DIR \
&& chmod --recursive 777 $COMPOSER_CACHE_DIR \
&& composer config --global cache-dir $COMPOSER_CACHE_DIR

# Install PHP dependencies
RUN apt-get install --yes \
    zlib1g-dev \
&& apt-get clean \
&& pecl install \
    redis \
&& pecl clear-cache \
&& docker-php-ext-install \
    pdo_mysql \
    opcache \
    zip \
&& docker-php-ext-enable \
    redis

CMD ["exit", "0"]
