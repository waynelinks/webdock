# Logs Forwarder infrastructure

This directory contains files required to run
logs forwarder infrastructure.

## Deployment

...

### Requirements

Docker daemon have to be configured to send logs
to the `fluent_forwarder` service.

Following configuration assumes that `FLUENT_FORWARDER_PORT`
variable is equal to `24224`.

```
$ cat /etc/docker/daemon.json
{
    "log-driver": "fluentd",
    "log-opts": {
        "fluentd-address": "127.0.0.1:24224",
        "tag": "docker",
        "labels": "version"
    }
}
```

Restart Docker daemon to load new configuration:

```
$ sudo service docker restart
```

Remember that Docker will throw an error if `fluent_forwarder` service
will not be available during start of any container.

### Prerequisites

```
$ cp .env.example .env
```

Set released version number in `DOCKER_IMAGE_VERSION` variable.

### Setup

```
$ make setup
```
