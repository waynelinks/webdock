#!/usr/bin/env groovy

node {
    checkout scm

    DockerComposeEnvFile envFile = new DockerComposeEnvFile(this)
    String projectName = "webclient${env.BUILD_ID}".toString()
    String uniqueTag = "unreleased${env.BUILD_ID}".toString()
    String releaseTag = "example${env.BUILD_ID}".toString()

    stage('Prepare CI environment') {
        sh "docker build --no-cache --tag damlys/webdock-web-client:${uniqueTag} ."

        envFile.replaceAll("""
COMPOSE_PROJECT_NAME=${projectName}

COMPOSE_FILE=./compose/00-app.yml:./compose/99-dev.yml
COMPOSE_PATH_SEPARATOR=:

APP_VERSION=${uniqueTag}
APP_ENVIRONMENT=prod
APP_DEBUG=on

APP_API_GATEWAY_DSN=http://docker.localhost:81
""".toString())
        sh 'docker volume create global_npm_cache'
        sh 'docker-compose up -d --remove-orphans'
    }

    stage('Build application codebase') {
        sh 'docker-compose exec assets_builder npm install'
        sh 'docker-compose exec assets_builder npm run build'
    }

    stage('Build Docker image') {
        sh "docker build --no-cache --tag damlys/webdock-web-client:${uniqueTag} ."
    }

    stage('Test application codebase') {
        sh 'docker-compose exec assets_builder npm run test'
    }

    stage('Test Docker image') {
        envFile.replace('COMPOSE_FILE', './compose/00-app.yml')
        envFile.replace('APP_ENVIRONMENT', 'test')
        envFile.replace('APP_DEBUG', 'off')
        sh 'docker-compose up -d --remove-orphans'

        // run black-box tests here
    }

    stage('Shutdown CI environment') {
        sh 'docker-compose down --remove-orphans --volumes'
    }

    stage('Release Docker image') {
        sh "docker tag damlys/webdock-web-client:${uniqueTag} damlys/webdock-web-client:${releaseTag}"
        sh "docker push damlys/webdock-web-client:${releaseTag}"
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
