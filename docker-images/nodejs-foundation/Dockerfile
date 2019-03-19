#:latest
FROM node:slim
USER root
WORKDIR /app
ENV VERSION="undefined"

# node=1000:node=1000 present

RUN apt-get update \
&& apt-get install --yes \
  bash-completion \
  git \
&& apt-get clean \
&& echo ". /etc/bash_completion" >> ~/.bashrc

RUN npm completion > /etc/bash_completion.d/npm \
&& npm config set --global progress=false \
&& npm config set --global unsafe-perm=true \
&& npm config set --global update-notifier=false

ENV NODE_ENV="production"

ENTRYPOINT []
CMD ["node", "--version"]
HEALTHCHECK NONE
