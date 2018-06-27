Web Assets Builder
===

[Changelog](./CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-web-assets-builder:unreleased .
```

#### Test

See test stage in the [Jenkinsfile](./Jenkinsfile.groovy).

#### Release

```
$ docker tag damlys/webdock-web-assets-builder:unreleased damlys/webdock-web-assets-builder:example
$ docker push damlys/webdock-web-assets-builder:example
```
