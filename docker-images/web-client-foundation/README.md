# Web Client Foundation

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
$ nginx -v \
  && envsubst --version \
  && curl --version
```

### Push

```
$ docker-compose push this
```
