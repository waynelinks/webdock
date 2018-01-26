WebDock's SPA image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Prerequisites

To start working with this repository you have to install this software:

* [Docker Engine](https://docs.docker.com/engine/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Machine](https://docs.docker.com/machine/) (for MacOS and Windows only)
  * [Docker Machine NFS](https://github.com/adlogix/docker-machine-nfs) is recommended
    to speed up transferring files between Docker Machine and MacOS

This is how you can check if it is installed:

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

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-spa:latest .
```

#### Release

```
$ docker push damlys/webdock-spa:latest
```

### Run

```
$ cp .env.dist .env
$ docker-compose up -d
```

Open port 80 in the browser.

\* Remember to build and release at least one version of
WebDock's Node image when `docker-compose.building.yml` file is used.

## Useful links

- [Scripts - NPM](https://docs.npmjs.com/misc/scripts)
