FROM node:latest

RUN npm completion >> ~/.bashrc

ARG NPM_CACHE_DIR="/var/cache/npm"
RUN mkdir --parents $NPM_CACHE_DIR \
&& chmod --recursive 777 $NPM_CACHE_DIR \
&& npm config set cache $NPM_CACHE_DIR --global

RUN apt-get install --yes git

RUN npm install --global \
    typescript \
    webpack \
    webpack-cli \
&& rm -rf $NPM_CACHE_DIR/*

CMD ["sleep", "infinity"]
