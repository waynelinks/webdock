pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                sh 'cp .env.dist .env'

                sh 'make build-all-images'
            }
        }
        stage('Test') {
            steps {
                sh 'make up'

                sh 'make download-codebase-assets.dev'
                sh 'make build-codebase-assets.dev'

                sh 'make run-codebase-tests'

                sh 'make stop'
            }
        }
        stage('Build') {
            steps {
                sh 'make up'

                sh 'make download-codebase-assets.prod'
                sh 'make build-codebase-assets.prod'

                sh 'make build-images'

                sh 'make stop'
            }
        }
        stage('Release') {
            steps {
                sh 'make release-images'
            }
        }
        stage('Deliver') {
            steps {
                echo 'Delivering...'
            }
        }
    }
}
