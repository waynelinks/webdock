[<-- Back to main section](../README.md)

# Best practices

> May be a little deprecated :)

1. Use official Docker images.
1. Replace all `latest` images tags to specific versions before first deployment
   to production. E.g. change `FROM php:fpm` to `FROM php:7.1-fpm`
   or `image: mysql:latest` to `image: mysql:10.3` and so on.
1. Use [12 factor app](https://12factor.net/) principles during modifying and expanding
   Docker for your application.
1. Use `COMPOSE_FILE` variable inside `.env` file to determine which files should
   be used with `docker-compose` command.
1. Use `docker-compose.development.yml` file to adjust Docker environment for
   development purposes.  
   Do not create `docker-compose.production.yml` file. It will make that your
   development environment will be less similar with production environment.
1. `backend` and `frontend` images should contains only applications codebase - do not store
   user's data (files, session, email spool etc.) inside this container. You
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
1. Use `.env` file to pass environment variables to your application.
1. Use Docker internal network in your functional tests. Do not expose application 80 port
   only for this purpose.

## Useful links

* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
* [Best practices for writing Dockerfiles](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)
* [Compose file version 2 reference](https://docs.docker.com/compose/compose-file/compose-file-v2/)
* [Environment variables in Compose](https://docs.docker.com/compose/environment-variables/)
* [New in Symfony 3.2: Runtime Environment Variables](https://symfony.com/blog/new-in-symfony-3-2-runtime-environment-variables)
* [Jenkins User Handbook: Pipeline](https://jenkins.io/doc/book/pipeline/)
