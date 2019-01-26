# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## Unreleased

## [0.11.1] - 2019-01-26

### Fixed

- Install beta Xdebug version for PHP 7.3.
- Install `libzip-dev` package required by PHP 7.3 `zip` extension.

## [0.11.0] - 2019-01-26

### Added

- Attach services defined inside `docker-images` directory to `none` network.
- `scale` property for services inside `docker-composes` directory.

### Changed

- Revert Docker Swarm stacks.
- Remove `env_file: .env` from Docker Compose files.

### Fixed

- PHP Xdebug installation tests.

## [0.10.1] - 2019-01-14

### Changed

- Use Alpine Linux within Jenkins images.

## [0.10.0] - 2018-12-31

### Added

- Monorepo approach.
- Use `*_XDEBUG_ENABLE` environment variables instead of `operation --install-xdebug` commands.

### Changed

- Use `docker-compose.yml` files instead of `Makefile` within Docker Images directories.

### Fixed

- Selenium Grid Hub and Selenium Nodes connection.

## [0.9.1] - 2018-12-19

### Added

- Jenkins AnsiColor plugin.
- Add Docker Registry to automation stack.
- Add Docker Hub mirror to automation stack.

### Fixed

- Add `X-Version` header to HTTP responses regardless of the response code.

## [0.9.0] - 2018-12-09

### Added

- Handle package managers cache with Docker build cache.
- Docker Swarm stacks.
- Health check with the `cgi-fcgi` tool.
- Add `notary` client to Jenkins Slave image.

### Changed

- Use `docker:dind` image in automation stack.

### Removed

- Jenkins theme customization.
- Delete `terraform` from Jenkins Slave image.

## [0.8.3] - 2018-11-24

### Added

- Install PostgreSQL library inside `php-web-server-foundation` image.

### Changed

- Change `restart: on-failure` to `restart: always` for services that works continuously.
- Rename `DOCKER_IMAGE_VERSION` to `VERSION`.
- Use Selenium Hub instead of standalone drivers.

## [0.8.2] - 2018-10-22

### Added

- Install `zip` and `unzip` packages inside `php-web-server-foundation` image.

### Changed

- Indent lines with 2 spaces by default.

### Fixed

- Add `npm-debug.log` file to `.gitignore` and `.dockerignore`.

## [0.8.1] - 2018-10-17

### Added

- Install Configuration as Code Jenkins plugin.
- Customize Jenkins theme as code.
- Install `jq` inside Jenkins images.

## [0.8.0] - 2018-10-07

### Added

- `php-web-server-tester` image and `http_tester` service.
- `web-client-tester` image and `web_tester` service.

### Changed

- Regroup Compose files (`99-development.yml` -> `01-development.yml`).
- Merge `php-web-server` and `web-client` repositories into `web-application-stack` monorepo.
- Use `config.json.template` instead of `env.js.template`.

## [0.7.7] - 2018-10-05

### Added

- Migrator service inside `php-web-server` repository.
- Missing memory and CPU limits for Compose services.
- MongoDB and PostgreSQL services.
- Use YAML anchors to avoid repetitions in Compose files.

### Removed

- Consul script from `jenskins-slave` image.

### Fixed

- Allow to use package managers as super user.

## [0.7.6] - 2018-10-01

### Added

- Group parsed json logs under `parsed_json_log` key.

### Changed

- Move Jenkins infrastructure to `composes/automation-server/` directory.
- Divide `90-operations.yml` into `21-management.yml` and `90-mocks.yml`.

### Removed

- HTTP basic auth from `php-web-server` and `web-client` applications.

## [0.7.5] - 2018-09-30

### Added

- Monitoring Stack repository.

### Changed

- Rename Makefile `bash` target to `shell`.
- Make every image in each repository independent.

### Removed

- Loggers from application's Docker Compose files.

## [0.7.4] - 2018-09-20

### Added

- Logs collecting with Fluentd and MongoDB.

## [0.7.3] - 2018-09-12

### Added

- `automation-server` repository with Jenkins images and infrastructure.
- Add named volumes to Docker Compose files for stateful services.

## [0.7.2] - 2018-09-10

### Added

- Use official Nginx package source inside `php-web-server-foundation` image.
- Fill in containers restart policies.

## [0.7.1] - 2018-09-07

### Added

- Add `DOCKER_IMAGE_PREFIX` variable to avoid tight connection between VSC repository and Docker registry.

### Changed

- Little documentation update.

## [0.7.0] - 2018-09-05

### Changed

- Make Docker Compose infrastructure and image build processes fully independent.

## [0.6.1] - 2018-08-29

### Added

- Install `sass` inside Web Assets Builder image. 
- Add `application_builder` service inside PHP Web Server repository.
- Makefile to foundation repositories.
- Multi-stage build inside Web Client repository.

### Changed

- Rename `example` tags to `0.0.1-example`.

## [0.6.0] - 2018-08-01

### Added

- Common user name for all backing services (`BACKING_SERVICES_USER`).

### Changed

- Split `web` container into `http_server` and `cgi_server`.
- Move files required to build Docker images to `image/` directories.
- Run application processes with `deploy` user.

## [0.5.2] - 2018-06-26

### Fixed

- Environments variables in cron jobs.

## [0.5.1] - 2018-06-26

### Added

- Add `X-Version` HTTP header to Nginx responses.
- [Adminer](https://hub.docker.com/_/adminer/) container.
- [Redis Commander](https://hub.docker.com/r/rediscommander/redis-commander/) container.
- [RabbitMQ Management](https://www.rabbitmq.com/management.html) support.
- MailHog credentials.
- `APP_XDEBUG_REMOTE_AUTOSTART` env.
- `operations.bash` file.
- Memory limits in Docker Compose files.
- Move application code to `/opt/app/` directory.
- Add `file_uploads` to PHP configuration file.
- Bash completion support.
- NPM `postinstall` script.
- Send `Cache-Control: no-cache` header by default.

### Changed

- Rename `php-foundation` to `php-web-server-foundation`.
- `APP_NGINX_CGI_AUTHORITY` env.

### Fixed

- Clear a package managers cache after every package installation command.
- Create external volumes commands.
- Broken healthcheck.

## [0.5.0] - 2018-04-24

### Added

- `index.html.template` file inside Web Client service.
- Support for custom Nginx basic auth credentials.

### Changed

- Rename `repositories/` to `services/` and folders inside:
  ```
  api-foundation -> php-foundation
  api            -> php-web-server
  node           -> web-assets-builder
  spa            -> web-client
  ```
- Use global volumes for package managers cache.
- Move `docker-compose.*.yml` files to `compose/` directory.
- Rename `.env.dist` file to `.env.compose`.
- Use data source name (DSN) convention for attached resources in Dockerfiles.
- Healthcheck for PHP `--start-web` entrypoint.

### Removed

- Cache volumes from Dockerfiles.

## [0.4.6] - 2018-03-25

### Added

- `APP_PHP_SESSION_DATABASE_ID` env.
- `make build` commands.
- RabbitMQ service in the API repository.
- Git inside API Foundation and Node images.

### Changed

- Move Xdebug output dir to `app/xdebug/`.
- Reorganize Dockerfiles for better cache support - move app's stuff
  at the end of the file.
- Rename `latest` tag to `example` for project's images.
- Remove hosts and ports from `.env` file.
- Rename `build` tag to `unreleased` for project's images.

### Fixed

- Clear NPM cache directory after image dependencies installation.
- Install `zip` extension in the API Foundation image.
- Redirect Nginx 404 page to the application's front controller.

## [0.4.5] - 2018-03-12

### Added

- Full Nginx config files.
- `APP_PHP_FPM_WORKERS_COUNT` and `APP_NGINX_WORKERS_COUNT` envs.
- `--start-fpm` and `--start-nginx` entrypoints.

### Changed

- Reorganize Dockerfiles for better cache support.

### Fixed

- Install OPcache in the API Foundation image.

### Removed

- Ability to build Docker images with Docker Compose cli.
- CI service directory (moved [here](https://github.com/damlys/webdock-ci)).

## [0.4.4] - 2018-03-01

### Added

- PHP-FPM config file.

### Changed

- Redirect Cron output to STDOUT and STDERR.
- Log PHP errors to STDERR.

## [0.4.3] - 2018-02-15

### Changed

- Move `env.js.template` file to etc directory.

### Removed

- `index_dev.php` front controller.

## [0.4.2] - 2018-01-29

### Added

- Project documentation.

## [0.4.1] - 2018-01-26

### Added

- Shebang lines in Jenkinsfiles.
- Documentation for each repository.

### Fixed

- Ignore CI's .env file.
- Allow `jenkins` user to use `docker` command inside `ci` container.

## [0.4.0] - 2018-01-15

### Changed

- Change the project name.
- Divide services into separate directories.

## [0.3.1] - 2017-12-05

### Added

- `api`'s `--install-xdebug` entrypoint.

### Removed

- `docker-compose.ci.yml` file.

## [0.3.0] - 2017-12-01

### Added

- Nginx supports HTTP/2.
- Add Webpack to `spa_node` image.

### Changed

- Rename services: `backend` into `api`, `backend_base` into `api_fundament`,
  `frontend` into `spa` and `frontend_node` into `spa_node`.
- Move `backend/Dockerfile.base` to `backend_base/Dockerfile` and
  `frontend/Dockerfile.node` to `frontend_node/Dockerfile`.
- Expose `backend` and `frontend` ports with `docker-compose.expose.yml`
  file.

## [0.2.3] - 2017-11-11

### Added

- Images entrypoints.

### Changed

- Remove startup commands from `backend`'s codebase.

## [0.2.2] - 2017-11-09

### Added

- Jenkinsfile pipeline stages.
- `frontend/Dockerfile.node` image.

### Changed

- Use `backend/Dockerfile.base` instead of `backend-base` image. 

## [0.2.1] - 2017-11-07

### Added

- `backend-base` image to speed up `backend` image building process. 

## [0.2.0] - 2017-11-06

### Changed

- Break `application` into `backend` and `frontend`.
- Use MySQL instead of MariaDB.

### Removed

- `storage` service.

## [0.1.0] - 2017-08-25

### Changed

- Merge `application`, `php`, `nginx` containers into `application`.

## [0.0.2] - 2017-08-08

### Added

- Makefile `dcs.redis.flush` target.

### Changed

- Refactor PHP environment variables.

### Security

- Protect Redis with a password.

## [0.0.1] - 2017-08-07

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
