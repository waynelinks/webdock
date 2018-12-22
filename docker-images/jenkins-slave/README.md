# Jenkins Slave

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
  && docker-compose --version \
  && kubectl version --client --short \
  && helm version --client --short \
  && curl --version \
  && git --version \
  && jq --version \
  && make --version \
  && notary version \
  && vault --version
```

### Push

```
$ docker-compose push this
```
