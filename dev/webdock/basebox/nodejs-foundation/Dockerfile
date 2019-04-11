#:latest
FROM node:slim
USER root
WORKDIR /app
ENV VERSION="undefined"

# node=1000:node=1000 present

RUN apt-get update

RUN rm -rf /var/cache/npm /var/cache/yarn \
&& mkdir --parents /var/cache/npm /var/cache/yarn \
&& chmod --recursive a+rw /var/cache/npm /var/cache/yarn \
&& npm config set cache /var/cache/npm --global \
&& yarn config set cache-folder /var/cache/yarn --global \
&& su --command "yarn config set cache-folder /var/cache/yarn --global" node

RUN apt-get install --yes \
  bash-completion \
&& apt-get clean \
&& echo ". /etc/bash_completion" >> ~/.bashrc \
&& npm completion > /etc/bash_completion.d/npm
ADD https://raw.githubusercontent.com/dsifford/yarn-completion/master/yarn-completion.bash /etc/bash_completion.d/yarn

RUN npm config set progress false --global \
&& npm config set unsafe-perm true --global \
&& npm config set update-notifier false --global

ENV NODE_ENV="production"

ENTRYPOINT []
CMD ["node", "--version"]
HEALTHCHECK NONE
