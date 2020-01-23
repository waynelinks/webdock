FROM node:slim AS rte

# User and group are already present:
# /etc/passwd  ->  node:x:1000:1000::/home/node:/bin/bash
# /etc/group   ->  node:x:1000:

ENV NODE_ENV="production"
WORKDIR /app
ENTRYPOINT ["node"]
CMD ["-e", "process.stderr.write(\"Node.js command not defined.\");process.exit(127);"]

# Configure NPM registries
ARG WEBDOCK_REGISTRY_SCHEME="http"
ARG WEBDOCK_REGISTRY_HOST="127.0.0.1"
ARG WEBDOCK_REGISTRY_PORT="54873"
ARG WEBDOCK_REGISTRY_SCOPE="webdock"
ENV NPM_TOKEN=""
ENV WEBDOCK_REGISTRY_TOKEN=""
RUN npm config set "@${WEBDOCK_REGISTRY_SCOPE}:registry" "${WEBDOCK_REGISTRY_SCHEME}://${WEBDOCK_REGISTRY_HOST}:${WEBDOCK_REGISTRY_PORT}" --global \
&& rm -f /root/.npmrc \
&& touch /root/.npmrc \
&& echo "//${WEBDOCK_REGISTRY_HOST}:${WEBDOCK_REGISTRY_PORT}/:_authToken=\${WEBDOCK_REGISTRY_TOKEN}" >> /root/.npmrc \
&& echo "//registry.npmjs.org/:_authToken=\${NPM_TOKEN}" >> /root/.npmrc

# Set NPM cache directory
RUN rm -rf /var/cache/npm \
&& mkdir --parents /var/cache/npm \
&& chmod --recursive a+rw /var/cache/npm \
&& npm config set cache /var/cache/npm --global


FROM rte AS sdk

ENV NODE_ENV="development"

# Configure NPM
RUN npm config set unsafe-perm true --global

# Bash completion
RUN apt-get update && apt-get install --yes --no-install-recommends \
  bash-completion \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
&& echo ". /etc/bash_completion" >> ~/.bashrc \
&& npm completion > /etc/bash_completion.d/npm
