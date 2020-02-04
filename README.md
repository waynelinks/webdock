WebDock
===

Cloud native and framework agnostic boilerplate with Docker & Kubernetes for TypeScript projects

<p align="center">
  <img alt="Project structure diagram" src="docs/project-structure-diagram.svg?sanitize=true">
</p>

## Requirements

Node.js and NPM

```console
$ node --version
v12.15.0
$ npm --version
6.13.4
```

Docker client and server

```console
$ docker version
Client: Docker Engine - Community
 Version:           19.03.4
Server: Docker Engine - Community
 Engine:
  Version:          19.03.4
```

Docker Compose

```console
$ docker-compose version --short
1.25.2
```

Recommended: use Docker BuildKit

```console
$ export DOCKER_BUILDKIT="1"
$ export COMPOSE_DOCKER_CLI_BUILD="1"
```

`kubectl` and Kubernetes cluster

```console
$ kubectl version --short
Client Version: v1.16.2
Server Version: v1.16.2
```

Helm

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
$ npm config set "//npm.pkg.github.com/:_authToken" "<TOKEN>"
$ npm config set "@damlys:registry" "https://npm.pkg.github.com"

$ docker login --username="<USER>" --password="<TOKEN>" "docker.pkg.github.com"

$ helm registry login "docker.pkg.github.com" --username="<USER>" --password="<TOKEN>"
```

## Development

Follow the pipeline

```console
$ ./pipeline.bash
...

*** 17:48:28 *** END ***

Done!
```
