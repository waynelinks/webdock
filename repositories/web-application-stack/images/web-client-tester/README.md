# Web Client Tester image

This directory contains files required to build and release
Docker image that contains set of test cases used to test
the [Web Client](../web-client/README.md) application's UI.

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

`WEBCLIENTTESTER_TESTS_TARGET_URL` - ...

...
