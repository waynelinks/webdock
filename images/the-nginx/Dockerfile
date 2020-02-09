FROM nginx:1.16-alpine AS dist

# User and group are already present:
# /etc/passwd  ->  nginx:x:101:101:nginx:/var/cache/nginx:/sbin/nologin
# /etc/group   ->  nginx:x:101:nginx

COPY ./etc/nginx/nginx.conf /etc/nginx/nginx.conf
RUN rm -f /etc/nginx/conf.d/*.conf
COPY ./etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app
ENTRYPOINT ["nginx"]
CMD []
