ARG BASE_IMAGE_NAME="docker.pkg.github.com/damlys/webdock/the-nodejs"
ARG BASE_IMAGE_TAG="0.0.0"


FROM ${BASE_IMAGE_NAME}:sdk-${BASE_IMAGE_TAG} AS dist

ARG GITHUB_PACKAGES_TOKEN
ARG NPM_TOKEN
COPY ./package.json ./package-lock.json /app/
RUN npm install \
&& npm cache clean --force

COPY . /app

ENTRYPOINT ["npm"]
CMD ["run"]
