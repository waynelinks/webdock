ARG DOCKER_IMAGE_PREFIX="damlys/webdock-"

FROM ${DOCKER_IMAGE_PREFIX}php-web-server-foundation:0.0.1-example

ENV WEBSERVERTESTER_TESTS_TARGET_URL="http://127.0.0.1:80" \
    WEBSERVERTESTER_XDEBUG_REMOTE_AUTOSTART="off" \
    WEBSERVERTESTER_XDEBUG_REMOTE_HOST="127.0.0.1" \
    WEBSERVERTESTER_XDEBUG_REMOTE_PORT="9000" \
    WEBSERVERTESTER_XDEBUG_IDE_KEY="DOCKER"

COPY bin/operation.bash /usr/local/bin/operation
COPY etc/php/php.ini /usr/local/etc/php/conf.d/zzz-php.ini
COPY etc/php/xdebug.ini /usr/local/etc/php/conf.d/zzz-xdebug.ini

RUN chmod a+x /usr/local/bin/operation

COPY app/ /opt/app/
WORKDIR /opt/app/
RUN composer install --no-dev --no-interaction
