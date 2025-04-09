pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the project...'
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'npm test'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t ci-cd-demo .'
            }
        }

        stage('Docker Run') {
            steps {
                echo 'Running Docker container...'
                sh 'docker run -d -p 3000:3000 --name ci-cd-container ci-cd-demo'
            }
        }
    }
}
