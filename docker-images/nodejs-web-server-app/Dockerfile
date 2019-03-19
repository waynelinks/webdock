FROM 127.0.0.1:5000/webdock/nodejs-web-server-foundation:0.0.1-example

COPY app/package.json app/package-lock.json /app/
RUN npm install --production \
&& npm cache clean --force

ENV APP_DEFAULT_LOCALE="en-US"
ENV APP_DEFAULT_TIMEZONE="UTC"

COPY app /app
RUN npm run build \
&& chmod --recursive a+r /app \
&& chmod --recursive a+x /app/bin/*
