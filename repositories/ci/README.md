WebDock's CI image
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
$ docker build --no-cache --tag damlys/webdock-ci:latest .
```

#### Release

```
$ docker push damlys/webdock-ci:latest
```

### Run

```
$ cp .env.dist .env
$ docker-compose up -d
```

Open port 8080 in the browser.

## Useful links

- [Using a Jenkinsfile](https://jenkins.io/doc/book/pipeline/jenkinsfile/)
