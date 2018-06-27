#!/usr/bin/env groovy

node {
    checkout scm

    dir('repositories/web-assets-builder') {
        def dockerImage

        stage('Build') {
            dockerImage = docker.build('damlys/webdock-web-assets-builder')
        }

        stage('Test') {
            dockerImage.inside {
                sh 'git --version'
                sh 'node --version'
                sh 'npm --version'
                sh 'tsc --version'
                sh 'webpack --version'
                sh 'webpack-cli --version'
            }
        }

        stage('Release') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                dockerImage.push('example')
            }
        }
    }
}
