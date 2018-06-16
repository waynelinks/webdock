Web Client Foundation
===

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-web-client-foundation:unreleased .
```

#### Test

See [Jenkinsfile](Jenkinsfile)'s test stage.

#### Release

```
$ docker tag damlys/webdock-web-client-foundation:unreleased damlys/webdock-web-client-foundation:example
$ docker push damlys/webdock-web-client-foundation:example
```
