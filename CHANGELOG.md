# PHPdock Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## Unreleased

## 0.2.3 - 2017-11-11

### Added

- Images entrypoints.

### Changed

- Remove startup commands from `backend`'s codebase.

## 0.2.2 - 2017-11-09

### Added

- Jenkinsfile pipeline stages.
- `frontend/Dockerfile.node` image.

### Changed

- Use `backend/Dockerfile.base` instead of `backend-base` image. 

## 0.2.1 - 2017-11-07

### Added

- `backend-base` image to speed up `backend` image building process. 

## 0.2.0 - 2017-11-06

### Changed

- Break `application` into `backend` and `frontend`.
- Use MySQL instead of MariaDB.

### Removed

- `storage` service.

## 0.1.0 - 2017-08-25

### Changed

- Merge `application`, `php`, `nginx` containers into `application`.

## 0.0.2 - 2017-08-08

### Added

- Makefile `dcs.redis.flush` target.

### Changed

- Refactor PHP environment variables.

### Security

- Protect Redis with a password.

## 0.0.1 - 2017-08-07

### Added

- Nginx container with self-signed SSL certificate.
- PHP container with Xdebug and Crontab.
- Composer container.
- NPM container.
- Redis container.
- MariaDB container.
- PhpMyAdmin container.
- MailHog container.
- Storage container (data-only container pattern).
