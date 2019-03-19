FROM 127.0.0.1:5000/webdock/nodejs-foundation:0.0.1-example

COPY app/package.json app/package-lock.json /app/
RUN npm install --production \
&& npm cache clean --force

ENV TESTER_TARGET_ENTRYPOINT="http://127.0.0.1:80"

COPY app /app
RUN npm run build \
&& chmod --recursive a+r /app
