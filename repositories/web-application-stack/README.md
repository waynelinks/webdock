Web Application Stack
===

...

## Getting started

...

### Requirements

```
$ make --version; \
  docker --version; \
  docker-compose --version; \
  docker run --rm hello-world
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

## Development

1. Go to `images/` directory. For each image:
    1. Build application.
    1. Run unit tests.
    1. Build image.
1. Go to `composes/` directory. For each compose:
    1. Setup infrastructure.
    1. Run system tests.
1. Go back to `images/` directory. For each image:
    1. Release image with version number.
1. Tag repository with version number.

## Deployment

1. Checkout repository to any released version number.
1. Go to `composes/` directory. For each compose:
    1. Set released version number in `DOCKER_IMAGE_VERSION` variable (in `.env` file).
    1. Setup infrastructure.

## Contributing

...

### Versioning

[Semantic Versioning](http://semver.org/)?

### Changelog

[Keep a Changelog](https://keepachangelog.com/)?
