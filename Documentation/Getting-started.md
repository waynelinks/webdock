[<-- Back to main section](../README.md)

# Getting started

These instructions will help you run any sub-repository from this project.

## Prerequisites

### Docker

To start working with WebDock's repositories you have to install this software:

* [Docker Engine](https://docs.docker.com/engine/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Machine](https://docs.docker.com/machine/) (for MacOS and Windows only)
  * [Docker Machine NFS](https://github.com/adlogix/docker-machine-nfs)
    is recommended to speed up transferring files between Docker Machine and MacOS

This is how you can check if it is installed:

```
$ docker --version
Docker version 17.05.0-ce, build 89658be
$ docker-compose --version
docker-compose version 1.9.0-rc3, build fcd38d3
$ docker-machine --version
...
```

### Hosts

Check Docker IP with `ifconfig docker0` command,
or `docker-machine ip` if you are working with Docker Machine.

```
$ ifconfig docker0
docker0   Link encap:Ethernet  HWaddr 02:42:be:e6:83:00  
          inet addr:172.17.0.1  Bcast:0.0.0.0  Mask:255.255.0.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
```

Add `172.17.0.1 docker.localhost www.docker.localhost` line to
the `/etc/hosts` file
(`C:\Windows\System32\Drivers\etc\hosts` file for Windows).

### Create Git repository

Copy any [sub-repository](../repositories/) from this project and create
own Git repository with copied files.

### Docker images repositories

[Docker Hub](https://hub.docker.com) is an official registry for Docker images.

Create own repositories for the following images and replace them in your project.

```
damlys/webdock-api-foundation
damlys/webdock-api
damlys/webdock-ci
damlys/webdock-node
damlys/webdock-spa
```

## Useful links

###### Docker

- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)
- [Compose file version 2 reference](https://docs.docker.com/compose/compose-file/compose-file-v2/)
- [Environment variables in Compose](https://docs.docker.com/compose/environment-variables/)
- [Repositories on Docker Hub](https://docs.docker.com/docker-hub/repos/)

###### Jenkins

- [Jenkins User Handbook: Pipeline](https://jenkins.io/doc/book/pipeline/)
- [Pipeline Syntax](https://jenkins.io/doc/book/pipeline/syntax/)
- [Using a Jenkinsfile](https://jenkins.io/doc/book/pipeline/jenkinsfile/)

###### PHP

- [Scripts - Composer](https://getcomposer.org/doc/articles/scripts.md)
- [thephpleague/flysystem: Abstraction for local and remote filesystems](https://github.com/thephpleague/flysystem)
- [New in Symfony 3.2: Runtime Environment Variables](https://symfony.com/blog/new-in-symfony-3-2-runtime-environment-variables)

###### Node.js

- [Scripts - NPM](https://docs.npmjs.com/misc/scripts)
