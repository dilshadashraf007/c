pipeline {
    agent any

    environment {
        IMAGE_NAME = "dilshadashraf007/python-app"
        NODE_PORT = "30007"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/dilshadashraf007/c.git/'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    bat "echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                bat """
                docker pull %IMAGE_NAME%:latest >nul 2>&1
                docker build --cache-from %IMAGE_NAME%:latest -t %IMAGE_NAME%:%BUILD_NUMBER% .
                """
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                bat "docker push %IMAGE_NAME%:%BUILD_NUMBER%"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat """
                kubectl config use-context minikube
                kubectl set image deployment/python-app-deployment ^
                python-app=%IMAGE_NAME%:%BUILD_NUMBER%
                kubectl rollout status deployment/python-app-deployment
                """
            }
        }

        stage('Show Application URL') {
            steps {
                echo "Application URL: http://localhost:${NODE_PORT}"
            }
        }
    }

    post {
        success {
            echo "CI/CD pipeline completed successfully"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}
