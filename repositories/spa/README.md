WebDock's SPA image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-spa:latest .
```

#### Release

```
$ docker push damlys/webdock-spa:latest
```

### Run

```
$ cp .env.dist .env
$ docker-compose up -d
```

Open port 80 in the browser.

\* Remember to build and release at least one version of
WebDock's Node image before this step.
