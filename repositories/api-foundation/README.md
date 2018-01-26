WebDock's API Foundation image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Prerequisites

To start working with this repository you have to install
[Docker Engine](https://docs.docker.com/engine/).

This is how you can check if it is installed:

```
$ docker --version
Docker version 17.05.0-ce, build 89658be
```

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-api-foundation:latest .
```

#### Release

```
$ docker push damlys/webdock-api-foundation:latest
```
