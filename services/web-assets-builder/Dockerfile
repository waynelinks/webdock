FROM node:latest

RUN npm completion >> ~/.bashrc

ARG NPM_CACHE_DIR="/var/cache/npm"
RUN mkdir --parents $NPM_CACHE_DIR \
&& chmod --recursive 777 $NPM_CACHE_DIR \
&& npm config set cache $NPM_CACHE_DIR --global

RUN apt-get install --yes \
    git \
&& apt-get clean

RUN npm install --global \
    typescript \
    webpack \
    webpack-cli \
&& npm cache clean --force

CMD ["sleep", "infinity"]
