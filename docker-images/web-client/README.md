# Web Client

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
$ docker-compose run builder
```

### Test

Run inside `builder` container:

```
$ npm install \
  && npm run unit-tests
```

### Push

```
$ docker-compose push this
```
