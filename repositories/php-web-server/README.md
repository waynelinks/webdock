PHP Web Server
===

[Changelog](./CHANGELOG.md)

## Getting started

### Prerequisites

1. Build and release at least one version of 
   [PHP Web Server Foundation](../php-web-server-foundation/README.md) image.

### Development

#### Run local runtime environment

```
$ make build-application
$ make build-image
$ cp .env.example .env
$ make setup
```

Open port 81 in the browser.
