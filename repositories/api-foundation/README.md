WebDock's API Foundation image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-api-foundation:unreleased .
```

#### Release

```
$ docker tag damlys/webdock-api-foundation:unreleased damlys/webdock-api-foundation:example
$ docker push damlys/webdock-api-foundation:example
```
