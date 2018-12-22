# Monitoring

## Deployment

### Requirements

Configure Docker daemon logging driver:

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

Restart Docker daemon to reload configuration:

```
$ sudo systemctl restart docker.service
```

### Prerequisites

```
$ cp .env.example .env
```

Set released version number in `VERSION` variable.

### Setup

```
$ make setup
```
