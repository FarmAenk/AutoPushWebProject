pipeline {
    agent any
    environment {
        IMAGE_NAME = "chat-app"
    }
    stages {
        stage('Checkout Code') {
            steps {
                // Ensure your Jenkins job is configured to use your GitHub repository
                // The git checkout is handled by the SCM block in the job config.
                echo "Checking out code..."
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} .'
            }
        }
        stage('Deploy Locally') {
            steps {
                sh 'docker-compose up -d --force-recreate'
            }
        }
    }
}
