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
