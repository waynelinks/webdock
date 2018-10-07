# PHP Web Server Tester image

This directory contains files required to build and release
Docker image that contains set of test cases used to test
the [PHP Web Server](../php-web-server/README.md) application's HTTP API.

## Development

...

### Build application

```
$ make build-application
```

### Run unit tests

```
$ make run-unit-tests
```

### Build image

```
$ make build
```

### Release image

```
$ make release version=0.0.1-example
```

## Runtime configuration

...

### Environment variables

`WEBSERVERTESTER_TESTS_TARGET_URL` - ...

...
