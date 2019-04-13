#:latest
FROM node:slim
ENV NODE_ENV="production"
USER root
WORKDIR /app
ENTRYPOINT []
CMD ["node", "--version"]
HEALTHCHECK NONE

# User and group present:
# > node:x:1000:1000::/home/node:/bin/bash
# > node:x:1000:

ENV VERSION="undefined"

# Set NPM and Yarn cache directories
RUN rm -rf /var/cache/npm /var/cache/yarn \
&& mkdir --parents /var/cache/npm /var/cache/yarn \
&& chmod --recursive a+rw /var/cache/npm /var/cache/yarn \
&& npm config set cache /var/cache/npm --global \
&& yarn config set cache-folder /var/cache/yarn --global \
&& su --command "yarn config set cache-folder /var/cache/yarn --global" node

# Bash completion
RUN apt-get update && apt-get install --yes --no-install-recommends \
  bash-completion \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
&& echo ". /etc/bash_completion" >> ~/.bashrc \
&& npm completion > /etc/bash_completion.d/npm
ADD https://raw.githubusercontent.com/dsifford/yarn-completion/master/yarn-completion.bash /etc/bash_completion.d/yarn

# Configure NPM
RUN npm config set progress false --global \
&& npm config set unsafe-perm true --global \
&& npm config set update-notifier false --global
