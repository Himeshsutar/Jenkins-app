pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                echo 'Cloning repository...'
                // Jenkins will auto-checkout if this is a GitHub project
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t my-app-image .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                sh 'docker run -d -p 3000:3000 --name my-app-container my-app-image'
            }
        }
    }
}
