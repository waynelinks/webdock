FROM damlys/webdock-php-web-server-foundation:0.0.1-example

ENV WEBSERVER_VERSION="undefined"
ENV WEBSERVER_CGI_SERVER_HOST="127.0.0.1"
ENV WEBSERVER_CGI_SERVER_PORT="9000"
ENV WEBSERVER_CGI_WORKERS_COUNT="1"
ENV WEBSERVER_HTTP_WORKERS_COUNT="1"
ENV WEBSERVER_OPCACHE_ENABLE="on"
ENV WEBSERVER_XDEBUG_ENABLE="off"
ENV WEBSERVER_XDEBUG_REMOTE_AUTOSTART="off"
ENV WEBSERVER_XDEBUG_REMOTE_CONNECT_BACK="off"
ENV WEBSERVER_XDEBUG_REMOTE_HOST="127.0.0.1"
ENV WEBSERVER_XDEBUG_REMOTE_PORT="9000"
ENV WEBSERVER_XDEBUG_IDE_KEY="DOCKER"
ENV WEBSERVER_ENVIRONMENT="prod"
ENV WEBSERVER_DEFAULT_CHARSET="UTF-8"
ENV WEBSERVER_DEFAULT_LOCALE="en-US"
ENV WEBSERVER_DEFAULT_TIMEZONE="UTC"
ENV WEBSERVER_CACHE_STORAGE_DSN="redis://127.0.0.1:6379?auth=password&database=1"
ENV WEBSERVER_DATA_STORAGE_DSN="mysql://username:password@127.0.0.1:3306/dbname"
ENV WEBSERVER_FILE_STORAGE_DSN="http://accesskey:secretkey@127.0.0.1:80/bucket0"
ENV WEBSERVER_MAIL_SENDER_URL="smtp://username:password@127.0.0.1:587"
ENV WEBSERVER_MESSAGE_QUEUE_DSN="amqp://username:password@127.0.0.1:5672"
ENV WEBSERVER_SESSION_STORAGE_DSN="redis://127.0.0.1:6379?auth=password&database=0"

COPY bin/entrypoint.bash /usr/local/bin/entrypoint
COPY bin/healthcheck.bash /usr/local/bin/healthcheck
COPY etc/cron/crontab /etc/crontab
COPY etc/nginx/nginx.conf.template /etc/nginx/nginx.conf.template
COPY etc/php/php.ini /usr/local/etc/php/conf.d/zzz-php.ini
COPY etc/php/php-fpm.conf /usr/local/etc/php-fpm.d/zzz-php-fpm.conf
COPY etc/php/xdebug.ini /usr/local/etc/php/conf.d/zzz-xdebug.ini

RUN chmod a+x /usr/local/bin/entrypoint \
&& chmod a+x /usr/local/bin/healthcheck

ENTRYPOINT ["entrypoint"]
CMD ["--start-http-server"]
HEALTHCHECK --timeout=3s CMD ["healthcheck"]

COPY --chown=deploy:deploy app/composer.json app/composer.lock /opt/app/
WORKDIR /opt/app
RUN su --command "composer install --no-dev" deploy

COPY --chown=deploy:deploy app /opt/app
RUN chmod a+x /opt/app/bin/* \
&& chmod a+w /opt/app/xdebug \
&& su --command "composer run-script build" deploy
