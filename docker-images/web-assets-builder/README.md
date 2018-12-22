# Web Assets Builder

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
$ node --version \
  && npm --version \
  && git --version \
  && sass --version \
  && tsc --version \
  && webpack --version \
  && webpack-cli --version
```

### Push

```
$ docker-compose push this
```
