# Jenkins Master image

This directory contains files required to build and release
Docker image that contains Jenkins master service.

## Configuration

Files from `etc/jenkins/casc` directory are used to reload
Jenkins configuration by `configuration-as-code` plugin.

## Development

...

### Build

```
$ make build
```

### Test

```
$ make test
```

### Release

```
$ make release version=0.0.1-example
```
