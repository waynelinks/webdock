pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                sh 'cp .env.dist .env'

                sh 'make pull-or-build-images'
            }
        }
        stage('Test') {
            steps {
                sh 'make up'

                sh 'make backend.download-codebase-assets.dev'
                sh 'make frontend.download-codebase-assets.dev'

                sh 'make backend.build-codebase-assets.dev'
                sh 'make frontend.build-codebase-assets.dev'

                sh 'make backend.run-codebase-tests'
                sh 'make frontend.run-codebase-tests'

                sh 'make stop'
            }
        }
        stage('Build') {
            steps {
                sh 'make up'

                sh 'make backend.download-codebase-assets.prod'
                sh 'make frontend.download-codebase-assets.prod'

                sh 'make backend.build-codebase-assets.prod'
                sh 'make frontend.build-codebase-assets.prod'

                sh 'make backend.build-image'
                sh 'make frontend.build-image'

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
