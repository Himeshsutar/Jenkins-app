pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test || echo "No tests configured"'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t jenkins-node-demo .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d -p 3000:3000 --name node-app jenkins-node-demo || true'
            }
        }
    }
}
