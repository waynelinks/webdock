#:latest
FROM php:fpm
USER root
WORKDIR /app
ENV VERSION="undefined"

RUN groupadd --gid 1000 deploy \
&& useradd --uid 1000 --gid deploy --shell /bin/sh --create-home deploy

RUN curl -fsSL https://getcomposer.org/installer -o /usr/local/bin/composer-installer \
&& php /usr/local/bin/composer-installer --install-dir=/usr/local/bin --filename=composer \
&& rm /usr/local/bin/composer-installer
ENV COMPOSER_ALLOW_SUPERUSER="1"

RUN apt-get update

RUN apt-get install --yes \
  bash-completion \
  git \
&& apt-get clean \
&& echo ". /etc/bash_completion" >> ~/.bashrc

RUN composer global require \
  bamarni/symfony-console-autocomplete \
&& composer clear-cache \
&& echo "$(php ~/.composer/vendor/bin/symfony-autocomplete --shell bash composer)" > /etc/bash_completion.d/composer

# `libfcgi0ldbl` package contains `cgi-fcgi` tool
RUN apt-get install --yes \
  libfcgi0ldbl \
&& apt-get clean

# Xdebug is disabled by default. Run `docker-php-ext-enable xdebug` command to enable it
RUN pecl install \
  xdebug \
&& pecl clear-cache

# `gettext` package contains `envsubst` tool
RUN apt-get update \
&& apt-get install --yes \
  gnupg \
&& apt-get clean \
&& echo 'deb http://nginx.org/packages/mainline/debian/ stretch nginx' >> /etc/apt/sources.list \
&& curl -fsSL http://nginx.org/keys/nginx_signing.key -o /root/nginx_signing.key \
&& apt-key add /root/nginx_signing.key \
&& apt-get update \
&& apt-get install --yes \
  gettext \
  nginx \
&& apt-get clean \
&& service nginx stop
EXPOSE 80

# `apt-get` is used here to install packages required by PHP extensions
RUN apt-get install --yes \
  libpq-dev \
  libzip-dev \
  zlib1g-dev \
&& apt-get clean \
&& pecl install \
  redis \
&& pecl clear-cache \
&& docker-php-ext-install \
  opcache \
  pdo_mysql \
  pdo_pgsql \
  zip \
&& docker-php-ext-enable \
  redis

COPY etc/php.ini /usr/local/etc/php/conf.d/zzz-php.ini
COPY etc/php-fpm.conf /usr/local/etc/php-fpm.d/zzz-php-fpm.conf
COPY etc/xdebug.ini /usr/local/etc/php/conf.d/zzz-xdebug.ini
ENV FPM_WORKERS_COUNT="1"
ENV OPCACHE_ENABLE="on"
ENV XDEBUG_ENABLE="off"
ENV XDEBUG_IDE_KEY="DOCKER"
ENV XDEBUG_REMOTE_AUTOSTART="off"
ENV XDEBUG_REMOTE_CONNECT_BACK="off"
ENV XDEBUG_REMOTE_HOST="127.0.0.1"
ENV XDEBUG_REMOTE_PORT="9000"

COPY etc/nginx.template.conf /etc/nginx/nginx.template.conf
ENV NGINX_CGI_SERVER_HOST="127.0.0.1"
ENV NGINX_CGI_SERVER_PORT="9000"
ENV NGINX_WORKERS_COUNT="1"

COPY bin/*.bash /usr/local/bin/
RUN chmod a+x /usr/local/bin/*.bash
ENTRYPOINT ["entrypoint.bash"]
CMD ["php", "--version"]
HEALTHCHECK NONE
