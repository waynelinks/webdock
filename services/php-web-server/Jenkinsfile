#!/usr/bin/env groovy

// Note:
// `bash -c ""` is a workaround for correct handling of PHP exit codes with Docker.

node {
    checkout scm

    DockerComposeEnvFile envFile = new DockerComposeEnvFile(this)
    String projectName = "webserver${env.BUILD_ID}".toString()
    String uniqueTag = "unreleased${env.BUILD_ID}".toString()
    String releaseTag = "example${env.BUILD_ID}".toString()

    stage('Prepare CI environment') {
        sh "docker build --no-cache --tag damlys/webdock-php-web-server:${uniqueTag} ."

        envFile.replaceAll("""
COMPOSE_PROJECT_NAME=${projectName}

COMPOSE_FILE=./compose/00-app.yml:./compose/10-resources.yml:./compose/99-dev.yml
COMPOSE_PATH_SEPARATOR=:

APP_VERSION=${uniqueTag}
APP_ENVIRONMENT=prod
APP_DEBUG=on

APP_PHP_FPM_WORKERS_COUNT=1

APP_CACHE_STORAGE_DSN=tcp://redis:6379?auth=secret&database=2
APP_DATA_STORAGE_DSN=mysql://demo:secret@mysql:3306/db0
APP_FILE_STORAGE_DSN=http://demo:secret123@minio:9000
APP_LOG_STORAGE_DSN=tcp://redis:6379?auth=secret&database=0
APP_MAIL_SENDER_URL=smtp://nobody:nobody@mailhog:1025
APP_MESSAGE_QUEUE_DSN=amqp://demo:secret@rabbitmq:5672
APP_SESSION_STORAGE_DSN=tcp://redis:6379?auth=secret&database=1

MINIO_ACCESS_KEY=demo
MINIO_SECRET_KEY=secret123
MYSQL_USER=demo
MYSQL_PASSWORD=secret
MYSQL_DATABASE=db0
RABBITMQ_USER=demo
RABBITMQ_PASSWORD=secret
REDIS_PASSWORD=secret
""".toString())
        sh 'docker volume create global_composer_cache'
        sh 'docker-compose up -d --remove-orphans'
    }

    stage('Build application codebase') {
        sh 'docker-compose exec web bash -c "composer install --no-dev"'
    }

    stage('Build Docker image') {
        sh "docker build --no-cache --tag damlys/webdock-php-web-server:${uniqueTag} ."
    }

    stage('Test application codebase') {
        sh 'docker-compose exec web bash -c "composer install --dev"'
        sh 'docker-compose exec web bash -c "composer run-script test"'
    }

    stage('Test Docker image') {
        envFile.replace('COMPOSE_FILE', './compose/00-app.yml:./compose/10-resources.yml')
        envFile.replace('APP_ENVIRONMENT', 'test')
        envFile.replace('APP_DEBUG', 'off')
        sh 'docker-compose up -d --remove-orphans'

        // run black-box tests here
    }

    stage('Shutdown CI environment') {
        sh 'docker-compose down --remove-orphans --volumes'
    }

    stage('Release Docker image') {
        sh "docker tag damlys/webdock-php-web-server:${uniqueTag} damlys/webdock-php-web-server:${releaseTag}"
        sh "docker push damlys/webdock-php-web-server:${releaseTag}"
    }
}

final class DockerComposeEnvFile {
    private Object cliContext
    private String fileContent
    DockerComposeEnvFile(Object context) {
        cliContext = context
        save()
    }
    void replaceAll(String content) {
        fileContent = content
        save()
        validate()
    }
    void replace(String variable, String value) {
        fileContent.replaceFirst(/^${variable}=/, "${variable}=${value}")
        save()
        validate()
    }
    private void save() {
        cliContext.sh("echo '${fileContent}' > .env")
    }
    private void validate() {
        cliContext.sh('docker-compose config --quiet')
    }
}
