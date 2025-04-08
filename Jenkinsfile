pipeline {
    agent {
        docker {
            image 'node:18'
            args '-p 3000:3000'
        }
    }

    environment {
        APP_NAME = 'jenkins-node-demo'
    }

    stages {
        stage('Debug PATH') {
            steps {
                echo 'Checking environment path and binaries...'
                sh 'echo $PATH'
                sh 'which node || echo node not found'
                sh 'which npm || echo npm not found'
                sh 'node -v || echo node not working'
                sh 'npm -v || echo npm not working'
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
                echo 'Running tests...'
                sh 'echo "No tests configured"'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $APP_NAME .'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Running Docker container...'
                sh '''
                docker rm -f node-app || true
                docker run -d -p 3000:3000 --name node-app $APP_NAME
                '''
            }
        }
    }
}
