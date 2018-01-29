WebDock's API image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-api:latest .
```

\* Build and release at least one version of
WebDock's API Foundation image before this step.

#### Release

```
$ docker push damlys/webdock-api:latest
```

### Run

```
$ cp .env.dist .env
$ docker-compose up -d
```

Open port 81 in the browser.

\* See [Xdebug](Documentation/Xdebug.md) page.
