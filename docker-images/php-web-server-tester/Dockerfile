FROM damlys/webdock-php-web-server-foundation:0.0.1-example

ENV WEBSERVERTESTER_XDEBUG_ENABLE="off"
ENV WEBSERVERTESTER_XDEBUG_REMOTE_AUTOSTART="off"
ENV WEBSERVERTESTER_XDEBUG_REMOTE_HOST="127.0.0.1"
ENV WEBSERVERTESTER_XDEBUG_REMOTE_PORT="9000"
ENV WEBSERVERTESTER_XDEBUG_IDE_KEY="DOCKER"
ENV WEBSERVERTESTER_TESTS_TARGET_URL="http://127.0.0.1:80"

COPY bin/entrypoint.bash /usr/local/bin/entrypoint
COPY etc/php/php.ini /usr/local/etc/php/conf.d/zzz-php.ini
COPY etc/php/xdebug.ini /usr/local/etc/php/conf.d/zzz-xdebug.ini

RUN chmod a+x /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]

COPY app/composer.json app/composer.lock /opt/app/
WORKDIR /opt/app
RUN composer install --no-scripts --no-autoloader --no-dev

COPY app /opt/app
RUN chmod a+w /opt/app/xdebug \
&& composer install --no-dev
