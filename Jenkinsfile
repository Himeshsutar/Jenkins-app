pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-node-app'
    }

    stages {
        stage('Install Dependencies') {
            agent {
                docker {
                    image 'node:18-alpine'
                }
            }
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            agent {
                docker {
                    image 'node:18-alpine'
                }
            }
            steps {
                sh 'echo "Running tests (placeholder)"'
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Docker Run') {
            steps {
                // Stop existing container if running (optional)
                sh 'docker rm -f my-node-app || true'
                sh 'docker run -d -p 3000:3000 --name my-node-app my-node-app'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
