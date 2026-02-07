pipeline {
    agent any

    environment {
        IMAGE_NAME = "dilshadashraf007/python-app"
        AWS_REGION = "ap-south-1"              // Change if needed
        EKS_CLUSTER = "your-eks-cluster-name" // Change to your cluster
        NODE_PORT = "30007"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/dilshadashraf007/myapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME:$BUILD_NUMBER ."
                sh "docker tag $IMAGE_NAME:$BUILD_NUMBER $IMAGE_NAME:latest"
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker push $IMAGE_NAME:$BUILD_NUMBER"
                sh "docker push $IMAGE_NAME:latest"
            }
        }

        stage('Update Kubeconfig for EKS') {
            steps {
                sh """
                aws eks update-kubeconfig \
                  --region $AWS_REGION \
                  --name $EKS_CLUSTER
                """
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh '''
                    kubectl apply -f k8s/deployment.yaml
                    kubectl apply -f k8s/service.yaml
                    kubectl rollout status deployment/python-app-deployment
                '''
            }
        }

        stage('Show Application URL') {
            steps {
                echo "Application deployed to EKS."
                echo "Use kubectl get svc to find the external IP or NodePort."
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
