# AWS DevOps Assignment - Dummy Data API Deployment

## Overview
This project automates the deployment of a **Node.js API** that generates dummy data using **Terraform & AWS ECS (Fargate)**.

## End-to-End Request Flow
- **Client → Sends request to API Gateway
- **API Gateway → Authenticates via Cognito, applies rate limits
- **ALB → Routes request to ECS API service
- **ECS API (Node.js) → Processes request, queries RDS if needed
- **RDS (PostgreSQL) → Returns data to ECS API
- **ECS API → Sends response back to client
- **CloudWatch → Monitors logs, sends alerts


## 📌 Features
- **Node.js API with Rate Limiting & Authentication**
- **Blue-Green Deployment Strategy**
- **CI/CD with GitHub Actions**
- **AWS API Gateway with Cognito Authentication**
- **AWS ECS Fargate for Container Orchestration**
- **Terraform Infrastructure as Code (Modular Approach)**
- **CloudWatch for Monitoring & Logging**
- **PostgreSQL on AWS RDS**

---

## 🚀 Deployment Guide

### 1️⃣ Prerequisites
- **Terraform** (`>= 1.0.0`)
- **AWS CLI** (`>= 2.x`)
- **GitHub Actions Secrets** configured:
  - `AWS_ACCESS_KEY`
  - `AWS_SECRET_KEY`
  - `AWS_ACCOUNT_ID`
  - `SNYK_TOKEN` (for security scans)

### 2️⃣ Clone the Repository
```sh
git clone https://github.com/yourusername/devops-assignment.git
cd devops-assignment
