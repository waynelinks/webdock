Automation stack
===

This repository contains files required to build and run
[Jenkins](https://jenkins.io/) automation server
with few pre-installed plugins:

- [AnsiColor](https://plugins.jenkins.io/ansicolor) (`ansicolor`),
- [Configuration as Code](https://plugins.jenkins.io/configuration-as-code) (`configuration-as-code`),
- [Docker](https://plugins.jenkins.io/docker-plugin) (`docker-plugin`),
- [Generic Webhook Trigger](https://plugins.jenkins.io/generic-webhook-trigger) (`generic-webhook-trigger`),
- [Git](https://plugins.jenkins.io/git) (`git`),
- [Git Parameter](https://plugins.jenkins.io/git-parameter) (`git-parameter`),
- [Matrix Authorization Strategy](https://plugins.jenkins.io/matrix-auth) (`matrix-auth`),
- [Pipeline](https://plugins.jenkins.io/workflow-aggregator) (`workflow-aggregator`),
- [Pipeline: Stage View](https://plugins.jenkins.io/pipeline-stage-view) (`pipeline-stage-view`),
- [SSH Agent](https://plugins.jenkins.io/ssh-agent) (`ssh-agent`)

and few useful CLI scripts inside:

- `make`,
- `jq`,
- `docker`,
- `docker-compose`,
- `kubectl`,
- `helm`,
- `notary`,
- `vault`.

## Getting started

The `images` directory contains files required to build
Docker images.

The `composes` directory contains files required to run
Docker Compose infrastructure with these images.

### Requirements

Following software is required to work with this repository:

```
$ make --version; \
  docker --version; \
  docker-compose --version
```

Check also if Docker daemon works correctly:

```
$ docker run --rm hello-world
```

### Prerequisites

Login to Docker registry:

```
$ docker login --username damlys
```

## Versioning

[Semantic Versioning](http://semver.org/)?

[Keep a Changelog](https://keepachangelog.com/)?
