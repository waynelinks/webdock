Web Application stack
===

This repository contains files required to build and run
web application.

## Getting started

The `images` directory contains files required to build
Docker images.

The `stacks` directory contains files required to run
Docker Swarm infrastructure with these images.

### Requirements

Following software is required to work with this repository:

```
$ make --version; \
  docker --version; \
  docker-compose --version
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

Build and release required versions of the following images:
- [PHP Web Server Foundation](../php-web-server-foundation/README.md),
- [Web Client Foundation](../web-client-foundation/README.md),
- [Web Assets Builder](../web-assets-builder/README.md).

Create volumes for package managers cache:

```
$ docker volume create --name=global_composer_cache
$ docker volume create --name=global_npm_cache
```

## Versioning

[Semantic Versioning](http://semver.org/)?

[Keep a Changelog](https://keepachangelog.com/)?
