FROM alpine:latest AS openssl

RUN apk update && apk add \
    openssl \
&& openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
    -keyout /tmp/self-signed.key \
    -out /tmp/self-signed.crt \
    -batch


FROM nginx:latest AS nginx

ENV NGINX_HTTP_AUTH_BASIC="off" \
    NGINX_AVAILABLE_PHP_FRONT_CONTROLLERS="index" \
    NGINX_DEFAULT_PHP_FRONT_CONTROLLER="index"

COPY default.template /etc/nginx/conf.d/default.template
COPY htpasswd /etc/nginx/htpasswd
COPY --from=openssl /tmp/self-signed.crt /etc/nginx/ssl/certificate.crt
COPY --from=openssl /tmp/self-signed.key /etc/nginx/ssl/certificate.key

RUN chmod 644 /etc/nginx/htpasswd \
&& mkdir -p /etc/nginx/ssl/ \
&& chmod 644 /etc/nginx/ssl/certificate.crt \
&& chmod 644 /etc/nginx/ssl/certificate.key

EXPOSE 80 443

# See "using environment variables in nginx configuration" at https://hub.docker.com/_/nginx/
CMD ["/bin/bash", "-c", "envsubst '$$NGINX_HTTP_AUTH_BASIC $$NGINX_AVAILABLE_PHP_FRONT_CONTROLLERS $$NGINX_DEFAULT_PHP_FRONT_CONTROLLER' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
