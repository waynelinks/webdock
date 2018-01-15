FROM nginx:latest

ENV APP_VERSION="undefined" \
    APP_API_ENDPOINT="http://localhost:8080" \
    APP_HTTP_AUTH_BASIC="off"

COPY app/public/ /app/public/
COPY bin/entrypoint.bash /usr/local/bin/entrypoint
COPY etc/nginx/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY etc/nginx/htpasswd /etc/nginx/htpasswd

RUN chmod 755 /usr/local/bin/entrypoint

WORKDIR /app/

ENTRYPOINT ["entrypoint"]

CMD ["--start"]
