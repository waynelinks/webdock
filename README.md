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

Note: Docker Swarm mode is not required

```console
$ docker info --format="{{.Swarm.LocalNodeState}}"
inactive
```

Recommended: use Docker BuildKit

```console
$ export DOCKER_BUILDKIT="1"
```

Docker Compose tool

```console
$ docker-compose version --short
1.25.2
```

Recommended: use BuildKit with Docker Compose

```console
$ export COMPOSE_DOCKER_CLI_BUILD="1"
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

Helm OCI support

```console
$ export HELM_EXPERIMENTAL_OCI="1"
```

GitHub Packages access

```console
$ export GITHUB_PACKAGES_TOKEN="<TOKEN>"
$ docker login --username="damlys" --password="<TOKEN>" "docker.pkg.github.com"
$ helm registry login "docker.pkg.github.com" --username="damlys" --password="<TOKEN>"
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
