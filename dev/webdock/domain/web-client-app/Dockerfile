FROM 127.0.0.1:5000/webdock/web-assets-builder:0.0.1-example AS builder

COPY app/package.json app/package-lock.json /app/
RUN npm install \
&& npm cache clean --force

COPY app /app
RUN npm run build


FROM 127.0.0.1:5000/webdock/web-client-foundation:0.0.1-example

ENV APP_API_GATEWAY_ENDPOINT="http://127.0.0.1:80"
ENV APP_DEFAULT_LOCALE="en-US"
ENV APP_DEFAULT_TIMEZONE="UTC"
ENV APP_ENV="production"

COPY --from=builder /app/build /app/build
COPY --from=builder /app/build-templates /app/build-templates
RUN chmod --recursive a+r /app
