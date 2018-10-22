# Automation Server infrastructure

This directory contains files required to run
automation server infrastructure.

## Deployment

...

### Requirements

Infrastructure is prepared to run Jenkins in a way called
Docker outside of Docker (DooD). That means Jenkins will
use the host's Docker daemon.

This case requires to map Jenkins's working directories
with the same path on host's file system to ensure that
Docker volumes mapping points to correct directories.

Following command will prepare host to run this infrastructure.

```
$ make prepare-host
...
Your Docker GID is: 999
```

### Prerequisites

```
$ cp .env.example .env
```

Set Docker GID in `HOST_DOCKER_GID` variable.

Set released version number in `DOCKER_IMAGE_VERSION` variable.

**Hey!** Do not use `*-development.yml` files outside of the local development environment!

### Setup

```
$ make setup
```

### Run implementation tests

```
$ make run-implementation-tests
```
