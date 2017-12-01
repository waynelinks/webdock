FROM nginx:latest

ENV SPA_HTTP_AUTH_BASIC="off" \
    SPA_API_ENDPOINT="http://127.0.0.1"

COPY VERSION /VERSION
COPY codebase/public/ /codebase/public/
COPY bin/entrypoint.bash /usr/local/bin/docker-entrypoint
COPY etc/nginx/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY etc/nginx/htpasswd /etc/nginx/htpasswd

RUN chmod 644 /VERSION \
&& chmod 755 /usr/local/bin/docker-entrypoint \
&& chmod 644 /etc/nginx/conf.d/default.conf.template \
&& chmod 644 /etc/nginx/htpasswd

WORKDIR /codebase/

ENTRYPOINT ["docker-entrypoint"]

CMD ["--start"]
