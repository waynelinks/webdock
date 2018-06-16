FROM damlys/webdock-web-client-foundation:example

ENV APP_VERSION="undefined" \
    APP_ENVIRONMENT="prod" \
    APP_DEBUG="off" \
    APP_NGINX_BASIC_AUTH="off" \
    APP_NGINX_BASIC_AUTH_USER="demo" \
    APP_NGINX_BASIC_AUTH_PASSWORD="secret" \
    APP_NGINX_WORKERS_COUNT="5" \
    APP_DEFAULT_CHARSET="UTF-8" \
    APP_DEFAULT_LOCALE="en-US" \
    APP_DEFAULT_TIMEZONE="UTC" \
    APP_API_GATEWAY_DSN="http://username:password@127.0.0.1:50080/"

COPY etc/nginx/nginx.conf.template /etc/nginx/nginx.conf.template
COPY etc/env.js.template /etc/env.js.template
COPY etc/index.html.template /etc/index.html.template

COPY bin/entrypoint.bash /usr/local/bin/entrypoint
RUN chmod a+x /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["--start-web"]

COPY app/public/ /app/public/
WORKDIR /app/
