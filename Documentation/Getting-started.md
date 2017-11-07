[<-- Back to main section](../README.md)

# Getting Started

These instructions will help you run PHPdock.

## Prerequisites

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

## First run

1. Check your Docker IP with `ifconfig docker0` command
   or `docker-machine ip` if you are using Docker Machine.
1. Add `{DOCKER_IP} phpdock.localhost www.phpdock.localhost` line to 
   the `/etc/hosts` file
   (`C:\Windows\System32\Drivers\etc\hosts` file for Windows).
1. Copy `.env.dist` to `.env` file and fill in environment variables.
1. Run `make build-images` and `make up` command inside project root directory.
1. Browse to [phpdock.localhost](http://phpdock.localhost)
   and [phpdock.localhost:81](http://phpdock.localhost:81)

## What next

### Docker images repository  

Create own repositories for the following images: 

- `damlys/phpdock-backend`
- `damlys/phpdock-backend-base`
- `damlys/phpdock-frontend`

[Docker Hub](https://hub.docker.com) is an official Docker repository. It allows
to create an unlimited count of public images.

### Application codebase

Copy your project codebase to `frontend/codebase/` or `backend/codebase/`
directory.

### Documentation

Delete `Documentation/*`, `CHANGELOG.md`, `LICENSE.md`, `README.md` files 
and write something own. If you don't know how to start see 
[this readme template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2).

### Building processes

Fill in following makefile targets to determine your codebase building processes:

- `backend.build-assets.dev`
- `backend.build-assets.prod`
- `frontend.build-assets.dev`
- `frontend.build-assets.prod`
