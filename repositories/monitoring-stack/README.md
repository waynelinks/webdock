Monitoring stack
===

This repository contains files required to run monitoring
platform.

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

## Versioning

[Semantic Versioning](http://semver.org/)?

[Keep a Changelog](https://keepachangelog.com/)?
