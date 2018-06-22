FROM node:latest

RUN apt-get update

# Set up NPM cache directory
ARG NPM_CACHE_DIR="/var/cache/npm"
RUN mkdir --parents $NPM_CACHE_DIR \
&& chmod --recursive 777 $NPM_CACHE_DIR \
&& npm config set cache $NPM_CACHE_DIR --global

# Install Git
RUN apt-get install --yes \
    git \
&& apt-get clean

# Install TypeScript
RUN npm install --global \
    typescript \
&& npm cache clean --force

# Install Webpack
RUN npm install --global \
    webpack \
    webpack-cli \
&& npm cache clean --force

# Bash completion
RUN apt-get install --yes \
    bash-completion \
&& apt-get clean \
&& echo ". /etc/bash_completion" >> ~/.bashrc \
&& npm completion >> ~/.bashrc

CMD ["sleep", "infinity"]
