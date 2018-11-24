# PHP Web Server infrastructure

This directory contains files required to run
web server infrastructure.

## Development

...

### Prerequisites

```
$ ln --symbolic .env.example .env
```

**Tip:** `*-development.yml` files will help you use this infrastructure
during application development.

### Setup

```
$ make setup
```

### Run unit tests

```
$ make run-unit-tests
```

### Run HTTP tests

```
$ make run-http-tests
```

## Deployment

...

### Prerequisites

```
$ cp .env.example .env
```

Set released version number in `VERSION` variable.

**Hey!** Do not use `*-development.yml` files outside of the local development environment!

### Setup

```
$ make setup stackName=webserver
```