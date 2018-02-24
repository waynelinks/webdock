WebDock's SPA image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-spa:build .
```

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

\* Build and release at least one version of
WebDock's Node image before this step.

## Security

Enable HTTP Basic Auth on non-production servers with the following value:

```
APP_HTTP_AUTH_BASIC=Restricted
```

Default credentials are `demo`/`demo`.
