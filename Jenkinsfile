pipeline {
    agent {
        docker {
            image 'node:18'
            args '-p 3000:3000'  // if you need to expose port
        }
    }

    stages {
        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install'
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo 'Running tests (optional)...'
                sh 'echo "No tests configured"'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t jenkins-node-demo .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                sh 'docker run -d -p 3000:3000 --name node-app jenkins-node-demo'
            }
        }
    }
}
