[<-- Back to main section](../README.md)

# Best practices

1. Use official Docker images.
1. Replace all `latest` images tags to specific versions before first deployment
   to production. E.g. change `FROM php:fpm` to `FROM php:7.1-fpm`
   or `image: mysql:latest` to `image: mysql:10.3` and so on.
1. Use [12 factor app](https://12factor.net/) principles during modifying and expanding
   PHPdock for your application.
1. Use `COMPOSE_FILE` variable inside `.env` file to determine which files should
   be used with `docker-compose` command.
1. Use `docker-compose.development.yml` file to adjust Docker environment for
   development purposes.  
   Do not create `docker-compose.production.yml` file. It will make that your
   development environment will be less similar with production environment.
1. Do not store user's data (files, sessions, email spool etc.) inside containers with 
   your application's codebase. You have to be prepared for replacing and scaling 
   these containers with newer versions during deployments.
1. Download and build codebase's assets, warm up cache files and so on before build
   image with codebase.
1. Make images as light as possible. Do not copy `node_modules/` and other unnecessary
   files for production during images building (add them to `.dockerignore` file).
1. Log errors to Docker STDERR (`/dev/stderr` file) and other stuff to
   Docker STDOUT (`/dev/stdout` file).
1. Use `Makefile` for integrating your application with CI/CD tools. This will allow 
   your team to make changes e.g. in codebase's assets building flow without changing 
   the CI/CD pipeline.
1. Use Docker internal network in your functional tests. Do not expose application 80 port
   only for this purpose.
1. Adjust `.env.dist` file to your development environment. Do not store production's dists 
   files in your repository. Keep them safe.

## Useful links

* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
* [Best practices for writing Dockerfiles](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)
* [Repositories on Docker Hub](https://docs.docker.com/docker-hub/repos/)
* [Compose file version 2 reference](https://docs.docker.com/compose/compose-file/compose-file-v2/)
* [Environment variables in Compose](https://docs.docker.com/compose/environment-variables/)
* [Jenkins User Handbook: Pipeline](https://jenkins.io/doc/book/pipeline/)
* [New in Symfony 3.2: Runtime Environment Variables](https://symfony.com/blog/new-in-symfony-3-2-runtime-environment-variables)
* [thephpleague/flysystem: Abstraction for local and remote filesystems](https://github.com/thephpleague/flysystem)
