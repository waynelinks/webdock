Web Client
===

[Changelog](./CHANGELOG.md)

## Getting started

### Prerequisites

1. Build and release at least one version of
   [Web Client Foundation](../web-client-foundation/README.md) image
   and [Web Assets Builder](../web-assets-builder/README.md) image.

### Development

#### Run local runtime environment

```
$ make build-application
$ make build-image
$ cp .env.example .env
$ make setup
```

Open port 80 in the browser.
