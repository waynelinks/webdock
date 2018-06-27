#!/usr/bin/env groovy

node {
    checkout scm

    dir('repositories/web-client-foundation') {
        def dockerImage

        stage('Build') {
            dockerImage = docker.build('damlys/webdock-web-client-foundation')
        }

        stage('Test') {
            dockerImage.inside {
                sh 'curl --version'
                sh 'envsubst --version'
                sh 'nginx -v'
                sh 'which htpasswd'
            }
        }

        stage('Release') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                dockerImage.push('example')
            }
        }
    }
}
