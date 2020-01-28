FROM node:slim AS rte

# User and group are already present:
# /etc/passwd  ->  node:x:1000:1000::/home/node:/bin/bash
# /etc/group   ->  node:x:1000:

ENV NODE_ENV="production"
WORKDIR /app
ENTRYPOINT ["node"]
CMD ["-e", "process.stderr.write(\"Node.js command not defined.\");process.exit(127);"]

# Configure NPM registries
ENV GITHUB_PACKAGES_TOKEN=""
ENV NPM_TOKEN=""
RUN npm config set "@damlys:registry" "https://npm.pkg.github.com" --global \
&& rm -f /root/.npmrc \
&& touch /root/.npmrc \
&& echo "//npm.pkg.github.com/:_authToken=\${GITHUB_PACKAGES_TOKEN}" >> /root/.npmrc \
&& echo "//registry.npmjs.org/:_authToken=\${NPM_TOKEN}" >> /root/.npmrc \
&& cp /root/.npmrc /home/node/.npmrc \
&& chown 1000:1000 /home/node/.npmrc

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
