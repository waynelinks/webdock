PHP Foundation
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-php-foundation:unreleased .
```

#### Test

See Jenkinsfile's test stage.

#### Release

```
$ docker tag damlys/webdock-php-foundation:unreleased damlys/webdock-php-foundation:example
$ docker push damlys/webdock-php-foundation:example
```
