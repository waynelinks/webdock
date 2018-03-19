FROM nginx:latest

ENV APP_ENVIRONMENT="prod" \
    APP_DEBUG="off" \
    APP_DEFAULT_CHARSET="UTF-8" \
    APP_DEFAULT_LOCALE="en-US" \
    APP_DEFAULT_TIMEZONE="UTC" \
    APP_VERSION="undefined" \
    APP_NGINX_BASIC_AUTH="off" \
    APP_NGINX_WORKERS_COUNT="1" \
    APP_API_URL="http://127.0.0.1:50080"

COPY etc/nginx/htpasswd /etc/nginx/htpasswd
COPY etc/nginx/nginx.conf.template /etc/nginx/nginx.conf.template
COPY etc/env.js.template /etc/env.js.template

COPY bin/entrypoint.bash /usr/local/bin/entrypoint
RUN chmod a+x /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["--start"]

COPY app/public/ /app/public/
WORKDIR /app/
