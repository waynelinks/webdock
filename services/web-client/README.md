Web Client
===

[Changelog](CHANGELOG.md)

## Getting started

### Prerequisites

1. Build and release at least one version of
   [Web Client Foundation](../web-client-foundation/README.md) image
   and [Web Assets Builder](../web-assets-builder/README.md) image.

### Prepare development environment

```
$ make build-image
$ cp .env.compose .env
$ make up
$ make build-app
```

Open port 80 in the browser.
