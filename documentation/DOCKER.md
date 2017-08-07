[<-- Back to main section](../README.md)

# Docker

All about Docker inside this project.

## Getting Started

These instructions will help you run project on your machine.

### Prerequisites

To start working with Docker and this repository you have to install this software:

* [Docker Engine](https://docs.docker.com/engine/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Machine](https://docs.docker.com/machine/) (for MacOS and Windows only)
  * [Docker Machine NFS](https://github.com/adlogix/docker-machine-nfs) is recommended
    to speed up transferring files between Docker Machine and your system

There is how you can check if you have installed these soft:

```
$ docker --version
Docker version 17.05.0-ce, build 89658be
$ docker-compose --version
docker-compose version 1.9.0-rc3, build fcd38d3
$ docker-machine --version
...
$ docker-machine-nfs
...
```

### Installation

1. Copy `.env.dist` to `.env` file and set appropriate values.
1. Check your Docker IP with `ifconfig docker0` command
   or `docker-machine ip` if you are using Docker Machine.
1. Add `{DOCKER_IP} {YOUR_DOMAIN} www.{YOUR_DOMAIN}` line to `/etc/hosts` file
   (`C:\Windows\System32\Drivers\etc\hosts` file for Windows).
1. Run `make dc.up` command.
1. Browse to `https://{YOUR_DOMAIN}/`.

## Running / Development

Keep in mind that both Docker and PHP application support many environments.
Depending on the project development stage we will use different combinations of them.

### Developing

During developing we want to use **development** Docker with **development** application.

```
COMPOSE_FILE=docker-compose.yml:docker-compose.expose.yml:docker-compose.build.yml:docker-compose.development.yml
```

1. `make dc.up`
1. `make app.build-dev`
1. Browse to `https://{YOUR_DOMAIN}/index_dev.php`.

### Running tests

For now there is only one set of tests that covers all services, even development.

Run `make dc.test` command on **development** Docker.

### Building and releasing

During building we will use **production** Docker and both
**development** and **production** application.

`docker-compose.build.yml` file contains everything what is needed
to build and release Docker images.

If we are using Docker internal network for functional tests then
there is no reason to expose Nginx ports.

```
COMPOSE_FILE=docker-compose.yml:docker-compose.build.yml
```

1. `make dc.up` or `make dc.rebuild` - run Docker images.
1. `make app.build-dev` - build application with development dependencies.
1. `make app.test.unit` - run unit tests.
1. `make app.test.integration` - run integration tests.
1. `make app.test.functional` - run functional tests.
1. `make app.build` - build application without development dependencies.
1. `make dc.rebuild` - build Docker images with production application.
1. `make dc.push` - push Docker images to Docker repository.
1. `make dc.purge` - delete Docker containers, networks and volumes.

Remember to update your services versions in `docker-compose.yml` file
before this procedure.

### Deploying

We always want to deploy **production** Docker with **production** application.

During this stage we are not using files under `application/` catalogue.
Everything that we need is inside Docker images.

We will also use `docker-compose.expose.yml` file to expose Nginx ports.

```
COMPOSE_FILE=docker-compose.yml:docker-compose.expose.yml
```

First run:

1. `make dc.up` - run Docker services.
1. `app.execute-database-migrations` - update database schema.

Updating:

1. Pull codebase from your code repository. 
1. Make sure that `.env` is consistent with `.env.dist`. 
   Fill in the missing fields otherwise.
1. `make dc.update` - update Docker services.
1. `app.execute-database-migrations` - update database schema.

## Best practices

1. Use official Docker images.
1. Replace all `latest` images tags to specific versions before first deployment
   to production. E.g. change `FROM php:fpm` to `FROM php:7.1-fpm`
   or `image: mariadb:latest` to `image: mariadb:10.3` and so on.
1. Use [12 factor app](https://12factor.net/) principles during modifying and expanding
   Docker for your application.
1. Use `COMPOSE_FILE` variable inside `.env` file to determine which files should
   be used with `docker-compose` command.
1. Use `docker-compose.development.yml` file to adjust Docker environment for
   development purposes.
1. Do not create `docker-compose.production.yml` file. It will make that your
   development environment will be less similar with production environment.
1. `application` container should contains only application codebase - do not store
   user's data (files, session etc.) or email spool inside this container. You
   have to be prepared for replacing this container and its content with newer 
   versions during deployments.
1. Create cache files, build front-end assets and so on before build
   `application` image.
1. Do not copy `node_modules/` and files needed to build front-end assets
   to `application` container during building (add them to `.dockerignore` file).
   Make images as light as possible.
1. Use `Makefile` for integrating your application with CI/CD tools. It will allow you
   to make changes (e.g. in application building flow) without changing CI/CD pipeline.
1. Log errors to Docker STDERR (`/dev/stderr` file) and other stuff to
   Docker STDOUT (`/dev/stdout` file).
1. Use `.env` file to pass environment variables to your application. There is
   an article how to handle them in
   [Symfony](https://symfony.com/blog/new-in-symfony-3-2-runtime-environment-variables).
1. Use Docker internal network in your functional tests. Your tests could connect with
   `nginx` host.

## Useful links

* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
* [Best practices for writing Dockerfiles](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)
* [Compose file version 2 reference](https://docs.docker.com/compose/compose-file/compose-file-v2/)
* [Environment variables in Compose](https://docs.docker.com/compose/environment-variables/)
