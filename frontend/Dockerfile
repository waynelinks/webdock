FROM nginx:latest

ENV FRONTEND_HTTP_AUTH_BASIC="off" \
    FRONTEND_SERVER_ENDPOINT="http://backend/"

COPY VERSION /VERSION
COPY codebase/public/ /codebase/public/
COPY bin/entrypoint.sh /usr/local/bin/docker-entrypoint
COPY etc/nginx/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY etc/nginx/htpasswd /etc/nginx/htpasswd

RUN chmod 644 /VERSION \
&& chmod -R 644 /codebase/public/ \
&& chmod 755 /usr/local/bin/docker-entrypoint \
&& chmod 644 /etc/nginx/conf.d/default.conf.template \
&& chmod 644 /etc/nginx/htpasswd

WORKDIR /codebase/

ENTRYPOINT ["docker-entrypoint"]

CMD ["--start"]
