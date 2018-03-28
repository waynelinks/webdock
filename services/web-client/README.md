Web Client
========================

[Changelog](CHANGELOG.md)

## Getting started

### Prerequisites

1. Build and release at least one version of Web Assets Builder image.

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-web-client:unreleased .
```

#### Run

```
$ cp .env.dist .env
$ docker-compose up -d
```

Open port 80 in the browser.

#### Test

Inside `assets_builder` container:

```
$ npm run test
```

#### Release

```
$ docker tag damlys/webdock-web-client:unreleased damlys/webdock-web-client:example
$ docker push damlys/webdock-web-client:example
```

### Deployment

Write something own here.

#### Security notes

Enable HTTP Basic Auth on non-production servers with the following value:

```
APP_NGINX_BASIC_AUTH=on
```

Credentials: `demo`/`demo`.
