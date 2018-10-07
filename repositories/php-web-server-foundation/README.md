PHP Web Server Foundation image
===

This repository contains files required to build and release
Docker image that has PHP runtime environment and PHP-FPM, 
Nginx and CRON services.

## Getting started

`Dockerfile` is required to build Docker image.

### Requirements

Following software is required to work with this repository:

```
$ make --version; \
  docker --version
```

Check also if Docker daemon works correctly:

```
$ docker run --rm hello-world
```

### Prerequisites

Login to Docker registry:

```
$ docker login --username damlys
```

## Development

...

### Build

```
$ make build
```

### Test

```
$ make test
```

### Release

```
$ make release version=0.0.1-example
```

## Versioning

[Semantic Versioning](http://semver.org/)?

[Keep a Changelog](https://keepachangelog.com/)?
