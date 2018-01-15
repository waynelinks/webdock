# This is an example of CI pipeline for projects written with PHPdock.
pipeline {
    stages {
        stage('Prepare') {
            steps {
                sh 'cp .env.dist .env'

                sh 'make pull-or-build-images'
            }
        }
        stage('Test') {
            steps {
                sh 'make up'

                sh 'make api.download-codebase-assets.dev'
                sh 'make spa.download-codebase-assets.dev'

                sh 'make api.build-codebase-assets.dev'
                sh 'make spa.build-codebase-assets.dev'

                sh 'make api.run-codebase-tests'
                sh 'make spa.run-codebase-tests'

                sh 'make stop'
            }
        }
        stage('Build') {
            steps {
                sh 'make up'

                sh 'make api.download-codebase-assets.prod'
                sh 'make spa.download-codebase-assets.prod'

                sh 'make api.build-codebase-assets.prod'
                sh 'make spa.build-codebase-assets.prod'

                sh 'make api.build-image'
                sh 'make spa.build-image'

                sh 'make stop'
            }
        }
        stage('Release') {
            steps {
                sh 'make release-images'
            }
        }
    }
}
