PHP Web Server
========================

[Changelog](CHANGELOG.md)

## Getting started

### Prerequisites

1. Build and release at least one version of PHP Foundation image.

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-php-web-server:unreleased .
```

#### Run

```
$ cp .env.dist .env
$ docker-compose up -d
```

Open port 81 in the browser.

#### Test

Inside `web` container:

```
$ composer run-script test
```

#### Release

```
$ docker tag damlys/webdock-php-web-server:unreleased damlys/webdock-php-web-server:example
$ docker push damlys/webdock-php-web-server:example
```

### Deployment

Write something own here.

#### Security notes

Enable HTTP Basic Auth on non-production servers with the following value:

```
APP_NGINX_BASIC_AUTH=on
```

Credentials: `demo`/`demo`.
