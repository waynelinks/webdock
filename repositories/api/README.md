WebDock's API image
========================

[Changelog](CHANGELOG.md)

## Getting started

### Development

#### Build

```
$ docker build --no-cache --tag damlys/webdock-api:build .
```

\* Build and release at least one version of
WebDock's API Foundation image before this step.

#### Release

```
$ docker tag damlys/webdock-api:build damlys/webdock-api:latest
$ docker push damlys/webdock-api:latest
```

### Run

```
$ cp .env.dist .env
$ docker-compose up -d
```

Open port 81 in the browser.

\* See [Xdebug](Documentation/Xdebug.md) page.

## Security

Enable HTTP Basic Auth on non-production servers with the following value:

```
APP_HTTP_AUTH_BASIC=Restricted
```

Default credentials are `demo`/`demo`.

#### phpMyAdmin service

Set empty values to the following envs to make sure that 
phpMyAdmin will ask for the credentials to the database.

```
PHPMYADMIN_USER=
PHPMYADMIN_PASSWORD=
```
