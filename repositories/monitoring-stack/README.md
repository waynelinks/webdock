Monitoring Stack
===

This repository contains files required to collect logs from
many Docker nodes into one place.

The Logs Forwarder, which will run on every node, is prepared 
to catch logs from Docker daemon and pass them to the Logs Collector.

## Getting started

The `images` directory contains files required to build
Docker images.

The `composes` directory contains files required to run
Docker Compose infrastructure with these images.

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

Create network for monitoring purposes:

```
$ docker network create monitoring_tier
```

## Versioning

[Semantic Versioning](http://semver.org/)?

[Keep a Changelog](https://keepachangelog.com/)?
