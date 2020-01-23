WebDock
===

Cloud native and framework agnostic boilerplate with Docker & Kubernetes for TypeScript projects

<p align="center">
  <img alt="Project structure diagram" src="docs/project-structure-diagram.svg?sanitize=true">
</p>

## Requirements

Docker client and server

```console
$ docker version
Client: Docker Engine - Community
 Version:           19.03.4
Server: Docker Engine - Community
 Engine:
  Version:          19.03.4
```

(Docker Swarm mode is not required)

```console
$ docker info --format="{{.Swarm.LocalNodeState}}"
inactive
```

Docker Compose tool

```console
$ docker-compose version --short
1.25.2
```

Kubectl tool and Kubernetes cluster

```console
$ kubectl version --short
Client Version: v1.16.2
Server Version: v1.16.2
```

Helm tool

```console
$ helm version --short
v3.0.2+g19e47ee
```

Helm Push plugin

```console
$ helm plugin list
NAME	VERSION	DESCRIPTION
push	0.8.1  	Push chart package to ChartMuseum
```

## Development

Follow the pipeline

```console
$ ./pipeline.bash
...

*** 17:48:28 *** END ***

Success!
```

Note: `.examples/` are adjusted to my private machine
