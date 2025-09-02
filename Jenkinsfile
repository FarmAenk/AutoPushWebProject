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

	stage('Clean Up') {
    		steps {
        		echo "Cleaning up old Docker images..."
        		// This command removes any untagged (dangling) images
        		sh 'docker image prune -f'
        		// This command removes all images with the 'chat-app' tag that are not currently in use
        		sh 'docker rmi $(docker images --filter "reference=chat-app:*" -q) || true'
    		}
	}
        stage('Build Docker Image') {
            steps {
		sh "docker build --build-arg CACHEBUSTER=\$(date +%s) -t chat-app-pipeline-web:latest ."
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
