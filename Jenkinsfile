pipeline {
    agent any

    environment {
        IMAGE_NAME = 'jenkins-node-demo'
        CONTAINER_NAME = 'node-app'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests (optional)...'
                sh 'echo "No tests configured"'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Clean up') {
            steps {
                echo 'Stopping and removing existing container...'
                sh "docker stop ${CONTAINER_NAME} || true"
                sh "docker rm ${CONTAINER_NAME} || true"
            }
        }

        stage('Deploy') {
            steps {
                echo 'Running Docker container...'
                sh "docker run -d -p 3000:3000 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
            }
        }
    }
}
