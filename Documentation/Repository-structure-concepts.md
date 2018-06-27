[<-- Back to main section](../README.md)

# Repository structure concepts

1. [multirepo](#multirepo)
1. [monorepo](#monorepo)
1. [microplatform](#microplatform)

## multirepo

```
web-client-service/
    compose/
        00-base.yml
        99-dev.yml
    e2e-tests/
        features/
    image/
        app/
            public/
        bin/
        etc/
        Dockerfile
    .env
    CHANGELOG.md
    Jenkinsfile.groovy
    README.md
```

```
web-server-service/
    compose/
        00-base.yml
        99-dev.yml
    e2e-tests/
        features/
    image/
        app/
            public/
        bin/
        etc/
        Dockerfile
    .env
    CHANGELOG.md
    Jenkinsfile.groovy
    README.md
```

```
web-client-foundation/
    CHANGELOG.md
    Dockerfile
    Jenkinsfile.groovy
    README.md
```

```
web-server-foundation/
    CHANGELOG.md
    Dockerfile
    Jenkinsfile.groovy
    README.md
```

```
web-assets-builder/
    CHANGELOG.md
    Dockerfile
    Jenkinsfile.groovy
    README.md
```

## monorepo

```
project-name/
    compose/
        .env
        00-base.yml
        99-dev.yml
        Jenkinsfile.groovy
        README.md
    e2e-tests/
        features/
        Jenkinsfile.groovy
        README.md
    web-client-service/
        app/
            public/
        bin/
        etc/
        Dockerfile
        Jenkinsfile.groovy
        README.md
    web-server-service/
        app/
            public/
        bin/
        etc/
        Dockerfile
        Jenkinsfile.groovy
        README.md
    web-client-foundation/
        Dockerfile
        Jenkinsfile.groovy
        README.md
    web-server-foundation/
        Dockerfile
        Jenkinsfile.groovy
        README.md
    web-assets-builder/
        Dockerfile
        Jenkinsfile.groovy
        README.md
    CHANGELOG.md
    README.md
```

## microplatform

```
project-name/
    compose/
        00-base.yml
        99-dev.yml
    e2e-tests/
        features/
    images/
        web-client-service/
            app/
                public/
            bin/
            etc/
            Dockerfile
        web-server-service/
            app/
                public/
            bin/
            etc/
            Dockerfile
    .env
    CHANGELOG.md
    Jenkinsfile.groovy
    README.md
```

```
web-client-foundation/
    CHANGELOG.md
    Dockerfile
    Jenkinsfile.groovy
    README.md
```

```
web-server-foundation/
    CHANGELOG.md
    Dockerfile
    Jenkinsfile.groovy
    README.md
```

```
web-assets-builder/
    CHANGELOG.md
    Dockerfile
    Jenkinsfile.groovy
    README.md
```
