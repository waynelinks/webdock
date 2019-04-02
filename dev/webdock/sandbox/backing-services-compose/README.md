# Backing services compose

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

Helpers

```
$ helpers/watch-logs.sh
```
