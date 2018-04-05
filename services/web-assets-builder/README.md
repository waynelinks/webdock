Web Assets Builder
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-web-assets-builder:unreleased .
```

#### Test

See [Jenkinsfile](Jenkinsfile)'s test stage.

#### Release

```
$ docker tag damlys/webdock-web-assets-builder:unreleased damlys/webdock-web-assets-builder:example
$ docker push damlys/webdock-web-assets-builder:example
```
