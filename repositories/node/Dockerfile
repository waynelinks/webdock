FROM node:latest

RUN npm completion >> ~/.bashrc

ARG NPM_CACHE_DIR="/var/cache/npm"
RUN mkdir --parents $NPM_CACHE_DIR \
&& chmod --recursive 777 $NPM_CACHE_DIR \
&& npm config set cache $NPM_CACHE_DIR --global
VOLUME $NPM_CACHE_DIR

RUN npm install --global \
    typescript \
    webpack \
&& rm -rf $NPM_CACHE_DIR/*

CMD ["sleep", "infinity"]
