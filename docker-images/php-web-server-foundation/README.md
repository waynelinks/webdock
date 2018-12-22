# PHP Web Server Foundation

## Development

### Pull

```
$ docker-compose pull this
```

### Build

```
$ docker-compose build this
```

### Shell

```
$ docker-compose run this
```

### Test

Run inside `this` container:

```
$ php --version \
  && php-fpm --version \
  && [ "$(php --version)" != *Xdebug* ] \
  && pecl version \
  && composer --version \
  && which cgi-fcgi \
  && nginx -v \
  && envsubst --version \
  && dpkg --status cron | grep 'Version' \
  && which cron \
  && which crontab \
  && curl --version \
  && git --version
```

### Push

```
$ docker-compose push this
```
