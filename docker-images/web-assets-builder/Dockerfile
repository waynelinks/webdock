FROM node:latest
CMD ["exit", "0"]

RUN apt-get update

RUN apt-get install --yes \
  git \
&& apt-get clean

RUN NPM_CACHE_DIR="/var/cache/npm" \
&& mkdir --parents ${NPM_CACHE_DIR} \
&& chmod --recursive 766 ${NPM_CACHE_DIR} \
&& npm config set --global \
  cache=${NPM_CACHE_DIR} \
  progress=false \
  unsafe-perm=true \
  update-notifier=false

RUN apt-get install --yes \
  bash-completion \
&& apt-get clean \
&& echo ". /etc/bash_completion" >> ~/.bashrc \
&& npm completion > /etc/bash_completion.d/npm

RUN npm install --global \
  sass \
  typescript \
  webpack \
  webpack-cli \
&& npm cache clean --force
