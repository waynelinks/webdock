PHP Web Server Foundation
===

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-php-web-server-foundation:unreleased .
```

#### Test

See [Jenkinsfile](Jenkinsfile)'s test stage.

#### Release

```
$ docker tag damlys/webdock-php-web-server-foundation:unreleased damlys/webdock-php-web-server-foundation:example
$ docker push damlys/webdock-php-web-server-foundation:example
```
