Node.js CI/CD Deployment on AWS EKS
Project Overview
This project demonstrates a fully automated CI/CD pipeline for deploying a Node.js application on AWS Elastic Kubernetes Service (EKS). The solution integrates GitHub, Jenkins, Docker, and Amazon ECR to automate the entire workflow—from code commit to production deployment.
The pipeline ensures consistent builds, faster deployments, and scalable application delivery using containerized infrastructure.
Architecture Overview
Deployment Flow:
Developer → GitHub → Jenkins (EC2) → Docker Build → Amazon ECR → AWS EKS → Load Balancer → Internet Users
Technology Stack
Category
Tools & Services
Backend
Node.js
Source Control
Git, GitHub
CI/CD Tool
Jenkins (on AWS EC2)
Containerization
Docker
Container Registry
Amazon ECR
Orchestration
AWS EKS (Kubernetes)
Cloud Platform
AWS
Load Balancer
AWS Elastic Load Balancer (ELB)
CI/CD Pipeline Workflow
Developer pushes code to the GitHub repository.
A GitHub webhook automatically triggers the Jenkins pipeline.
Jenkins performs the following stages:
Checks out the latest code
Installs application dependencies
Builds the Docker image
The Docker image is securely pushed to Amazon ECR.
Jenkins deploys the updated image to the AWS EKS cluster.
Kubernetes performs a rolling update of the Node.js pods.
The application is exposed through an AWS Load Balancer.
End users access the application via the internet.
Pipeline Stages
Continuous Integration (CI)
Source code checkout from GitHub
Application build
Docker image creation
Image push to Amazon ECR
Continuous Delivery (CD)
Deployment of updated image to AWS EKS
Kubernetes rolling updates
Application served via Load Balancer
Project Structure
Copy code

project-root/
│
├── app.js
├── package.json
├── Dockerfile
├── Jenkinsfile
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
└── README.md
Prerequisites
AWS account
Configured EKS cluster
Created ECR repository
Jenkins installed on an EC2 instance
Docker installed on Jenkins server
kubectl configured with EKS
GitHub repository with application code
Local Development
Install dependencies
Bash
Copy code
npm install
Start the application
Bash
Copy code
npm start
Build and Run Docker Image
Bash
Copy code
docker build -t node-app .
docker run -p 3000:3000 node-app
Deploy to AWS EKS
Bash
Copy code
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
Key Features
End-to-end automated CI/CD pipeline
Containerized Node.js application
Secure image storage in Amazon ECR
Scalable deployment using AWS EKS
Load-balanced public access
Zero-downtime rolling updates
