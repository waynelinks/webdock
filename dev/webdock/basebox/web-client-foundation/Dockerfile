FROM nginx:latest
USER root
WORKDIR /app
ENTRYPOINT ["entrypoint.bash"]
CMD ["nginx", "-v"]
HEALTHCHECK NONE
EXPOSE 80

ENV VERSION="undefined"

RUN groupadd --gid 1000 deploy \
&& useradd --uid 1000 --gid deploy --shell /bin/bash --create-home deploy

RUN apt-get update && apt-get install --yes --no-install-recommends \
  curl \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy Nginx configuration and set default runtime values
COPY etc/nginx.template.conf /etc/nginx/nginx.template.conf
# debug|info|notice|warn|error|crit|alert|emerg (http://nginx.org/en/docs/ngx_core_module.html#error_log)
ENV NGINX_LOG_LEVEL="error"
ENV NGINX_WORKERS_COUNT="1"

# Copy global container scripts
COPY bin/*.bash /usr/local/bin/
RUN chmod a+x /usr/local/bin/*.bash
