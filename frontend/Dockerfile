#ARG VERSION="N/A"
FROM nginx:latest

# TODO remove FRONTEND_VERSION
ENV FRONTEND_VERSION="N/A" \
    FRONTEND_HTTP_AUTH_BASIC="off" \
    FRONTEND_SERVER_ENDPOINT="http://backend/"

# TODO remove VERSION file from image
COPY VERSION /VERSION
COPY codebase/public/ /codebase/public/
COPY etc/nginx/default.template /etc/nginx/conf.d/default.template
COPY etc/nginx/htpasswd /etc/nginx/htpasswd

# TODO remove VERSION file from image
RUN chmod 644 /VERSION \
&& chmod -R 644 /codebase/public/ \
&& chmod 644 /etc/nginx/conf.d/default.template \
&& chmod 644 /etc/nginx/htpasswd

WORKDIR /codebase/

# TODO refactor FRONTEND_VERSION
CMD export FRONTEND_VERSION=$(cat /VERSION) \
&& envsubst '$$FRONTEND_VERSION $$FRONTEND_SERVER_ENDPOINT' < /codebase/public/env.template > /codebase/public/env.js \
&& envsubst '$$FRONTEND_HTTP_AUTH_BASIC' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf \
&& nginx -g 'daemon off;'
