pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Starting build'
                sh 'echo "Build completed successfully"'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests'
                sh 'echo "Tests completed successfully"'
            }
        }

    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
