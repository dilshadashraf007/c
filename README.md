# 🚀 Node.js CI/CD Deployment on AWS EKS

## 📌 Project Overview
This project demonstrates a **fully automated CI/CD pipeline** for deploying a Node.js application on **AWS Elastic Kubernetes Service (EKS)**.

The solution integrates **GitHub, Jenkins, Docker, and Amazon ECR** to automate the entire workflow—from code commit to production deployment.

It ensures:
- Consistent and reliable builds  
- Faster and automated deployments  
- Scalable and containerized infrastructure  

---

## 🏗️ Architecture Overview

### 🔄 Deployment Flow
Developer → GitHub → Jenkins (EC2) → Docker Build → Amazon ECR → AWS EKS → Load Balancer → Internet Users



---

## 🛠️ Technology Stack

| Category            | Tools & Services                  |
|--------------------|----------------------------------|
| Backend            | Node.js                          |
| Source Control     | Git, GitHub                      |
| CI/CD Tool         | Jenkins (on AWS EC2)             |
| Containerization   | Docker                           |
| Container Registry | Amazon ECR                       |
| Orchestration      | AWS EKS (Kubernetes)             |
| Cloud Platform     | AWS                              |
| Load Balancer      | AWS Elastic Load Balancer (ELB)  |

---

## 🔄 CI/CD Pipeline Workflow

1. Developer pushes code to the GitHub repository  
2. GitHub webhook triggers the Jenkins pipeline  
3. Jenkins executes the following:
   - Code checkout  
   - Dependency installation  
   - Docker image build  
4. Image is pushed to Amazon ECR  
5. Deployment to AWS EKS cluster  
6. Kubernetes performs rolling updates  
7. Application exposed via AWS Load Balancer  
8. End users access via the internet  

---

## ⚙️ Pipeline Stages

### 🔹 Continuous Integration (CI)
- Source code checkout  
- Application build  
- Docker image creation  
- Push image to Amazon ECR  

### 🔹 Continuous Delivery (CD)
- Deploy updated image to AWS EKS  
- Rolling updates with zero downtime  
- Application served via Load Balancer  

---

## 📁 Project Structure



project-root/
│
├── app.js
├── package.json
├── Dockerfile
├── Jenkinsfile
├── k8s/
│ ├── deployment.yaml
│ └── service.yaml
└── README.md


---

## 📋 Prerequisites

- AWS account  
- Configured EKS cluster  
- Amazon ECR repository  
- Jenkins installed on EC2  
- Docker installed on Jenkins server  
- kubectl configured with EKS  
- GitHub repository with code  

---

## 💻 Local Development

### Install dependencies
```bash
npm install

Start application
npm start
🐳 Build & Run Docker Image
docker build -t node-app .
docker run -p 3000:3000 node-app
☸️ Deploy to AWS EKS
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

Start application
npm start
🐳 Build & Run Docker Image
docker build -t node-app .
docker run -p 3000:3000 node-app
☸️ Deploy to AWS EKS
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml



🔗 Connect With Me
LinkedIn: https://www.linkedin.com/in/dilshadashraf7/
📌 Author

Dilshad Ashraf
DevOps & Cloud Enthusiast 🚀



