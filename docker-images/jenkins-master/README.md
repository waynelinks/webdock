# Jenkins Master

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
$ docker --version \
  && curl --version \
  && git --version \
  && jq --version \
  && make --version
```

### Push

```
$ docker-compose push this
```
