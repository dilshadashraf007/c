Node.js CI/CD Deployment on AWS EKS
This project demonstrates a complete CI/CD pipeline for deploying a Node.js application on AWS EKS using Jenkins, Docker, Amazon ECR, and GitHub.
The pipeline automates the entire process from code push to production deployment.
Architecture Overview
Flow:
Developer → GitHub → Jenkins (EC2) → Docker Build → Amazon ECR → AWS EKS → Load Balancer → Internet Users
Tech Stack
Backend: Node.js
Source Control: Git, GitHub
CI/CD Tool: Jenkins (running on AWS EC2)
Containerization: Docker
Container Registry: Amazon ECR
Orchestration: AWS EKS (Kubernetes)
Cloud Platform: AWS
Load Balancer: AWS ELB
CI/CD Pipeline Workflow
Developer pushes code to GitHub.
GitHub webhook triggers Jenkins pipeline.
Jenkins performs:
Code checkout
Install dependencies
Build Docker image
Docker image is pushed to Amazon ECR using credentials.
Jenkins deploys the new image to AWS EKS.
Kubernetes updates the Node.js pods.
Application is exposed through a Load Balancer.
End users access the application via the internet.
Pipeline Stages
Continuous Integration
Code checkout from GitHub
Build Node.js application
Build Docker image
Push image to Amazon ECR
Continuous Delivery
Deploy updated image to EKS
Kubernetes rolling update of pods
Application served through Load Balancer
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
EKS cluster created
ECR repository created
Jenkins installed on EC2
Docker installed
kubectl configured
GitHub repository
Run Application Locally
Bash
Copy code
npm install
npm start
Build and Run Docker Image
Bash
Copy code
docker build -t node-app .
docker run -p 3000:3000 node-app
Deploy to EKS
Bash
Copy code
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
Key Features
Fully automated CI/CD pipeline
Dockerized Node.js application
Secure image storage in Amazon ECR
Scalable deployment using AWS EKS
Load-balanced public access
Rolling updates with zero downtime
