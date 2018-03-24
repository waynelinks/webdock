WebDock's Node image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-node:unreleased .
```

#### Release

```
$ docker tag damlys/webdock-node:unreleased damlys/webdock-node:example
$ docker push damlys/webdock-node:example
```
