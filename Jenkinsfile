pipeline {
    agent any

    environment {
        IMAGE_NAME = 'jenkins-node-demo'
        CONTAINER_NAME = 'node-app'
        // Optionally prepend Node.js path if needed
        // PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/your/node/path:$PATH"
    }

    stages {

        stage('Debug PATH') {
            steps {
                echo 'Checking environment path and binaries...'
                sh 'echo $PATH'
                sh 'which node'
                sh 'which npm'
                sh 'node -v || echo "Node not found"'
                sh 'npm -v || echo "npm not found"'
            }
        }

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
                // Replace with: sh 'npm test'
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
                echo 'Stopping and removing any existing container...'
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
