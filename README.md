WebDock
===

WebDock is a minimalistic Docker starter for web applications.
Project is designed to build PHP micro services and SPA apps, but it can
be prepared for PHP MPA in few minutes.

## Getting started

These instructions will help you run any service from this project.

### Prerequisites

To start working with WebDock's services you have to install this software:

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

#### Hosts

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

### Copy files

Copy any [service](./services/) from this project to your
own Git repository and follow it's readme file.

#### Docker registry

[Docker Hub](https://hub.docker.com) is an official registry for Docker images.

Create own repositories for the following images and replace them in your projects.

```
damlys/webdock-php-web-server
damlys/webdock-php-web-server-foundation
damlys/webdock-web-assets-builder
damlys/webdock-web-client
damlys/webdock-web-client-foundation
```

## Useful links

- [12 factor app](https://12factor.net/)
- [Semantic Versioning 2.0.0](https://semver.org)
    - [Software release life cycle: Stages of development - Wikipedia](https://en.wikipedia.org/wiki/Software_release_life_cycle#Stages_of_development)
- [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

###### Docker

- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)
- [Repositories on Docker Hub](https://docs.docker.com/docker-hub/repos/)
- [Compose file version 2 reference](https://docs.docker.com/compose/compose-file/compose-file-v2/)
- [Compose file version 3 reference](https://docs.docker.com/compose/compose-file/)
- [Environment variables in Compose](https://docs.docker.com/compose/environment-variables/)
    - [Compose CLI environment variables](https://docs.docker.com/compose/reference/envvars/)

###### PHP

- [Scripts - Composer](https://getcomposer.org/doc/articles/scripts.md)
- [thephpleague/flysystem: Abstraction for local and remote filesystems](https://github.com/thephpleague/flysystem)
- [Plates - Native PHP Templates](http://platesphp.com)
- [RabbitMQ - PHP tutorial - "Hello World!"](https://www.rabbitmq.com/tutorials/tutorial-one-php.html)
- [New in Symfony 3.2: Runtime Environment Variables](https://symfony.com/blog/new-in-symfony-3-2-runtime-environment-variables)

###### Node.js

- [Scripts - NPM](https://docs.npmjs.com/misc/scripts)

###### Jenkins

- [Jenkins User Handbook: Pipeline](https://jenkins.io/doc/book/pipeline/)
- [Pipeline Syntax](https://jenkins.io/doc/book/pipeline/syntax/)
- [Using a Jenkinsfile](https://jenkins.io/doc/book/pipeline/jenkinsfile/)

## Useful Docker images

- [PHP](https://hub.docker.com/_/php/)
- [Node.js](https://hub.docker.com/_/node/)

###### HTTP server

- [Nginx](https://hub.docker.com/_/nginx/)

###### SMTP catcher

- [MailHog](https://hub.docker.com/r/mailhog/mailhog/)

###### Storage

- [MySQL](https://hub.docker.com/_/mysql/)
    - [Adminer](https://hub.docker.com/_/adminer/)
    - [phpMyAdmin](https://hub.docker.com/r/phpmyadmin/phpmyadmin/)
    - [MariaDB](https://hub.docker.com/_/mariadb/)
- [Postgres](https://hub.docker.com/_/postgres/)
- [Redis](https://hub.docker.com/_/redis/)
- [Minio](https://hub.docker.com/r/minio/minio/)
    - [Minio Client](https://hub.docker.com/r/minio/mc/)
- [Elasticsearch](https://hub.docker.com/_/elasticsearch/)
    - [Kibana](https://hub.docker.com/_/kibana/)
- [Logstash](https://hub.docker.com/_/logstash/)
  
###### AMQP server

- [RabbitMQ](https://hub.docker.com/_/rabbitmq/)

###### CI/CD

- [Jenkins](https://hub.docker.com/r/jenkins/jenkins/)
