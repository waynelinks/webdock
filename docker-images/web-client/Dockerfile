FROM damlys/webdock-web-assets-builder:0.0.1-example AS builder

COPY app/package.json app/package-lock.json /opt/app/
WORKDIR /opt/app
RUN npm install --ignore-scripts

COPY app /opt/app
RUN npm install \
&& npm run build


FROM damlys/webdock-web-client-foundation:0.0.1-example
# has user deploy:1000
# has group deploy:1000
# exposes port 80

ENV WEBCLIENT_VERSION="undefined" \
  WEBCLIENT_HTTP_WORKERS_COUNT="1" \
  WEBCLIENT_ENVIRONMENT="prod" \
  WEBCLIENT_DEBUG="off" \
  WEBCLIENT_DEFAULT_CHARSET="UTF-8" \
  WEBCLIENT_DEFAULT_LOCALE="en-US" \
  WEBCLIENT_DEFAULT_TIMEZONE="UTC" \
  WEBCLIENT_API_GATEWAY_DSN="http://username:password@127.0.0.1:80"

COPY bin/entrypoint.bash /usr/local/bin/entrypoint
COPY bin/healthcheck.bash /usr/local/bin/healthcheck
COPY etc/app/config.json.template /etc/opt/app/config.json.template
COPY etc/app/index.html.template /etc/opt/app/index.html.template
COPY etc/nginx/nginx.conf.template /etc/nginx/nginx.conf.template

RUN chmod a+x /usr/local/bin/entrypoint \
&& chmod a+x /usr/local/bin/healthcheck

ENTRYPOINT ["entrypoint"]
CMD ["--start-http-server"]
HEALTHCHECK --timeout=3s CMD ["healthcheck"]

COPY --from=builder --chown=deploy:deploy /opt/app/public /opt/app/public
WORKDIR /opt/app
