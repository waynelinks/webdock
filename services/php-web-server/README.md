PHP Web Server
===

[Changelog](CHANGELOG.md)

## Getting started

### Prerequisites

1. Build and release at least one version of 
   [PHP Web Server Foundation](../php-web-server-foundation/README.md) image.

### Prepare development environment

```
$ make build-image
$ cp .env.compose .env
$ make up
$ make build-app
```

Open port 81 in the browser.
