pipeline {
    agent any

    environment {
        IMAGE_NAME = "dilshadashraf007/python-app"
        NODE_PORT = "30007"
    }

    stages {

        stage('Clone Repo') {
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

        stage('Build & Push Image') {
            steps {
                bat """
                docker build -t %IMAGE_NAME%:%BUILD_NUMBER% .
                docker tag %IMAGE_NAME%:%BUILD_NUMBER% %IMAGE_NAME%:latest
                docker push %IMAGE_NAME%:%BUILD_NUMBER%
                docker push %IMAGE_NAME%:latest
                """
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat """
                kubectl apply -f k8s\\deployment.yaml
                kubectl apply -f k8s\\service.yaml
                kubectl rollout status deployment/python-app-deployment
                """
            }
        }

        stage('Show Application URL') {
            steps {
                echo "Application deployed at: http://localhost:${NODE_PORT}"
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}
