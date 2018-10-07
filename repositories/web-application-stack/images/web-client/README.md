# Web Client image

This directory contains files required to build and release
Docker image that contains web browser application.

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

`WEBCLIENT_VERSION` - ...

...

### Entrypoint commands

`--start-http-server` - ...

...
