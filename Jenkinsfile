pipeline {
    agent any

    environment {
        IMAGE_NAME = "faraz270903/devops-app"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

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
                echo 'Running automated tests'
                sh 'chmod +x test.sh && ./test.sh'
            }
        }

        stage('Package') {
            steps {
                echo 'Packaging application'
                sh 'tar -czf ../devops-app.tar.gz --exclude=.git .'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image'
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }

        stage('Docker Push') {
            steps {
                echo 'Pushing Docker image to Docker Hub'
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
                        docker logout
                    '''
                }
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
