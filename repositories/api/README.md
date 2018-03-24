WebDock's API image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Prerequisites

1. Build and release at least one version of WebDock's API Foundation image.

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-api:unreleased .
```

#### Test

> How to test application?

#### Release

```
$ docker tag damlys/webdock-api:unreleased damlys/webdock-api:example
$ docker push damlys/webdock-api:example
```

### Run

```
$ cp .env.dist .env
$ docker-compose up -d
```

Open port 81 in the browser.

#### Security notes

Enable HTTP Basic Auth on non-production servers with the following value:

```
APP_NGINX_BASIC_AUTH=on
```

Default credentials are `demo`/`demo`.
