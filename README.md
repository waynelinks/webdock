WebDock
===

WebDock is a Docker starter for web applications.

Project is designed to work with PHP micro services and SPA web clients,
but it is also great to work with PHP MPA.

## Table of contents

1. [Getting started](#getting-started)
1. [Useful links](./Documentation/Useful-links.md)
1. [Used Docker images](./Documentation/Used-Docker-images.md)
1. [PHP Debugging](./Documentation/PHP-Debugging.md)

## Getting started

The general structure of this starter:

```
└── repositories
    ├── automation-stack
    │   ├── composes
    │   │   └── automation
    │   └── images
    │       ├── jenkins-master
    │       └── jenkins-slave
    ├── monitoring-stack
    │   └── images
    │       ├── fluent-collector
    │       └── fluent-forwarder
    │   ├── stacks
    │   │   └── monitoring
    ├── php-web-server-foundation
    ├── web-application-stack
    │   └── images
    │       ├── php-web-server
    │       ├── php-web-server-tester
    │       ├── web-client
    │       └── web-client-tester
    │   ├── stacks
    │   │   ├── php-web-server
    │   │   └── web-client
    ├── web-assets-builder
    └── web-client-foundation
```

### Requirements

To start working with WebDock repositories you have to install
Docker and Docker Compose.
This is how you can check if it is properly installed:

```
$ docker --version; \
  docker run --rm hello-world; \
  docker-compose --version
```

### Hosts

Check Docker IP with `ifconfig docker0` command  
(`docker-machine ip` if you are working with Docker Machine).

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

Add `172.17.0.1 docker.localhost` line to the `/etc/hosts` file  
(`C:\Windows\System32\Drivers\etc\hosts` file for Windows).

### Copy files

Copy any [repository](./repositories/) from this project to your
own Git repository and follow it's readme file.

**Tip:** search for the `DOCKER_IMAGE_PREFIX` variable to learn about
connections between services in the project.
