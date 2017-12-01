[<-- Back to main section](../README.md)

# Getting Started

These instructions will help you use PHPdock.

## Prerequisites

To start working with Docker and this repository you have to install this software:

* [Docker Engine](https://docs.docker.com/engine/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Machine](https://docs.docker.com/machine/) (for MacOS and Windows only)
  * [Docker Machine NFS](https://github.com/adlogix/docker-machine-nfs) is recommended
    to speed up transferring files between Docker Machine and your operating system

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

## Run PHPdock

1. Clone git repository
    ```
    $ mkdir ~/workspace/your-project/
    $ cd ~/workspace/your-project/
    $ git clone https://github.com/damlys/phpdock.git .
    $ rm -rf .git/
    $ git init
    ```
1. Check your Docker IP with `ifconfig docker0` command
   or `docker-machine ip` if you are using Docker Machine.  
1. Add `{DOCKER_IP} phpdock.localhost www.phpdock.localhost` line to 
   the `/etc/hosts` file
   (`C:\Windows\System32\Drivers\etc\hosts` file for Windows).
1. Copy `.env.dist` to `.env` file.
1. Run `make build-all-images && make up` commands.
1. Browse to [phpdock.localhost](http://phpdock.localhost)
   and [phpdock.localhost:81](http://phpdock.localhost:81)

## Adapt PHPdock to your project

### Docker images repository  

Create own repositories for the following images: 

- `damlys/phpdock-backend`
- `damlys/phpdock-frontend`

[Docker Hub](https://hub.docker.com) is an official Docker repository. It allows
to create an unlimited count of repositories for public images.

### Application codebase

Copy your project codebase to `api/codebase/` and `spa/codebase/`
directory and remove artifacts after an old Vagrant and Docker environments.

### Documentation

Delete `Documentation/*`, `CHANGELOG.md`, `LICENSE.md`, `README.md` files 
and write something own. If you don't know how to start see 
[this readme template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2).

Feel free to modify existing documentation.

### Delivery processes

Fill in following Makefile targets to determine your codebase building processes:

- `api.build-assets.dev`
- `api.build-assets.prod`
- `spa.build-assets.dev`
- `spa.build-assets.prod`

You should also fill in these targets :)

- `api.run-tests`
- `spa.run-tests`
