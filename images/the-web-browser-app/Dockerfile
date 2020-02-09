FROM docker.pkg.github.com/damlys/webdock/the-nodejs:sdk-0.0.0 AS builder

ARG GITHUB_TOKEN
ARG NPM_TOKEN
COPY ./package.json ./package-lock.json /app/
RUN npm install \
&& npm cache clean --force

COPY . /app
RUN npm run build

ENTRYPOINT ["/app/node_modules/.bin/ts-node-dev", "/app/src/bin/cli.ts"]
CMD []
EXPOSE 8080


FROM docker.pkg.github.com/damlys/webdock/the-nginx:0.0.0 AS dist

ARG GITHUB_TOKEN
ARG NPM_TOKEN
COPY --from=builder /app/package.json /app/package-lock.json /app/
RUN npm install \
&& npm cache clean --force

COPY --from=builder /app/build /app/build

ENTRYPOINT ["node", "/app/build/bin/cli.js"]
CMD []
EXPOSE 8080
USER 1000
