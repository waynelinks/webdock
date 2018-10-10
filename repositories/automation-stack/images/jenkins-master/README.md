# Jenkins Master image

This directory contains files required to build and release
Docker image that contains Jenkins master service.

## Configuration

Files from `etc/jenkins/casc/` directory are used to reload
Jenkins configuration by `configuration-as-code` plugin.

Files from `resources/user-content/` directory will be copied to
`$WORKSPACE/userContent/` directory on container startup, but only
if they don't already exist. After that they will be public available
under `$URL/userContent/` path.

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
