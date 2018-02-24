WebDock's Node image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-node:build .
```

#### Release

```
$ docker tag damlys/webdock-node:build damlys/webdock-node:latest
$ docker push damlys/webdock-node:latest
```
