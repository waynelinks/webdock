FROM damlys/webdock-web-assets-builder:0.0.1-example AS builder

COPY app/package.json app/package-lock.json /opt/app/
WORKDIR /opt/app
RUN npm install

COPY app /opt/app
RUN npm run build


FROM damlys/webdock-web-client-foundation:0.0.1-example

ENV WEBCLIENT_VERSION="undefined"
ENV WEBCLIENT_HTTP_WORKERS_COUNT="1"
ENV WEBCLIENT_ENVIRONMENT="prod"
ENV WEBCLIENT_DEBUG="off"
ENV WEBCLIENT_DEFAULT_CHARSET="UTF-8"
ENV WEBCLIENT_DEFAULT_LOCALE="en-US"
ENV WEBCLIENT_DEFAULT_TIMEZONE="UTC"
ENV WEBCLIENT_API_GATEWAY_DSN="http://username:password@127.0.0.1:80"

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
