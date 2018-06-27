PHP Web Server Foundation
===

[Changelog](./CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-php-web-server-foundation:unreleased .
```

#### Test

See test stage in the [Jenkinsfile](./Jenkinsfile.groovy).

#### Release

```
$ docker tag damlys/webdock-php-web-server-foundation:unreleased damlys/webdock-php-web-server-foundation:example
$ docker push damlys/webdock-php-web-server-foundation:example
```
