# Web client

Runtime configuration for local usage

```
$ cp .dist/.env .
# or
$ ln -s .dist/.env .
```

Pipeline hooks

```
$ hooks/deploy.sh
$ hooks/test.sh
$ hooks/destroy.sh
```

Shell

```
$ docker-compose exec http_server bash
$ docker-compose exec builder bash
$ docker-compose exec web_tester bash
```

Helpers

```
$ helpers/init-codebase.sh
$ helpers/reset-files-permissions.sh
$ helpers/run-unit-tests.sh
$ helpers/watch-logs.sh
```
