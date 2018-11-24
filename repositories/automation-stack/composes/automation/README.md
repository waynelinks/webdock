# Automation infrastructure

This directory contains files required to run
automation infrastructure.

## Deployment

...

### Prerequisites

```
$ cp .env.example .env
```

Set released version number in `VERSION` variable.

**Hey!** Do not use `*-bind.yml` files outside of the local development environment!

### Setup

```
$ make setup
```

### Run tests

```
$ make run-integration-tests
```
