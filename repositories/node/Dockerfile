FROM node:latest

ARG NPM_CACHE_DIR="/var/cache/npm"

# https://docs.npmjs.com/cli/completion
RUN npm completion >> ~/.bashrc

RUN mkdir --parents $NPM_CACHE_DIR \
&& chmod --recursive 777 $NPM_CACHE_DIR \
&& npm config set cache $NPM_CACHE_DIR --global

RUN npm install --global \
    typescript \
    webpack

VOLUME $NPM_CACHE_DIR

CMD ["sleep", "infinity"]
