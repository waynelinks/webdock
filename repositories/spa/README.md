WebDock's SPA image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Prerequisites

1. Build and release at least one version of WebDock's Node image.

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-spa:build .
```

#### Test

> How to test application?

#### Release

```
$ docker tag damlys/webdock-spa:build damlys/webdock-spa:latest
$ docker push damlys/webdock-spa:latest
```

### Run

```
$ cp .env.dist .env
$ docker-compose up -d
```

Open port 80 in the browser.

#### Security notes

Enable HTTP Basic Auth on non-production servers with the following value:

```
APP_NGINX_BASIC_AUTH=on
```

Default credentials are `demo`/`demo`.
