WebDock's API Foundation image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-api-foundation:build .
```

#### Release

```
$ docker tag damlys/webdock-api-foundation:build damlys/webdock-api-foundation:latest
$ docker push damlys/webdock-api-foundation:latest
```
