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
		sh "docker build --build-arg CACHEBUSTER=\$(date +%s) -t chat-app:${env.BUILD_NUMBER} ."
            }
        }

        stage('Deploy Locally') {
            steps {
		sh 'docker compose stop'
        	sh 'docker compose rm -f'
        	sh 'docker compose up -d --force-recreate'
            }
        }
    }
}
