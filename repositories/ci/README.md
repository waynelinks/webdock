WebDock's CI image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-ci:latest .
```

#### Release

```
$ docker push damlys/webdock-ci:latest
```

### Run

```
$ cp .env.dist .env
$ docker-compose up -d
```

Open port 8080 in the browser.
