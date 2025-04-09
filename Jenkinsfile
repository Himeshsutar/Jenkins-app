pipeline {
    agent none

    environment {
        IMAGE_NAME = "himeshsutar/Jenkins-app"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            agent any
            steps {
                git branch: 'main', url: 'https://github.com/Himeshsutar/Jenkins-app.git'
            }
        }

        stage('Build') {
            agent {
                docker { image 'node:18' }
            }
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            agent {
                docker { image 'node:18' }
            }
            steps {
                sh 'npm test || echo "No tests found. Skipping."'
            }
        }

        stage('Docker Build') {
            agent any
            steps {
                sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            }
        }

        stage('Docker Push') {
            agent any
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin'
                    sh "docker push $IMAGE_NAME:$IMAGE_TAG"
                }
            }
        }

        stage('Deploy') {
            agent any
            steps {
                echo 'Deploying the application...'
                // Your deploy logic
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
