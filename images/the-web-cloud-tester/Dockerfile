ARG BASE_IMAGE_NAME="localhost:55000/webdock/the-nodejs"
ARG BASE_IMAGE_TAG="0.0.0"


FROM ${BASE_IMAGE_NAME}:sdk-${BASE_IMAGE_TAG} AS dist

ARG NPM_TOKEN
ARG WEBDOCK_REGISTRY_TOKEN
COPY ./package.json ./package-lock.json /app/
RUN npm install \
&& npm cache clean --force

COPY . /app

ENTRYPOINT ["npm"]
CMD ["run"]
