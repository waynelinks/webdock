ARG BASE_IMAGE_NAME="localhost:55000/webdock/the-nodejs"
ARG BASE_IMAGE_TAG="0.0.0"


FROM ${BASE_IMAGE_NAME}:sdk-${BASE_IMAGE_TAG} AS builder

ARG NPM_TOKEN
ARG WEBDOCK_REGISTRY_TOKEN
COPY ./package.json ./package-lock.json /app/
RUN npm install \
&& npm cache clean --force

COPY . /app
RUN npm run build \
&& chmod a+x /app/build/bin/*.js

ENTRYPOINT ["/app/node_modules/.bin/ts-node-dev", "/app/src/bin/cli.ts"]
CMD []
EXPOSE 8080


FROM ${BASE_IMAGE_NAME}:rte-${BASE_IMAGE_TAG} AS dist

ARG NPM_TOKEN
ARG WEBDOCK_REGISTRY_TOKEN
COPY --from=builder /app/package.json /app/package-lock.json /app/
RUN npm install \
&& npm cache clean --force

COPY --from=builder /app/build /app/build

ENTRYPOINT ["node", "/app/build/bin/cli.js"]
CMD []
EXPOSE 8080
USER 1000
