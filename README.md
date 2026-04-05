# DevOps Project 3 - Application Deployment

## Application
React-based OnlineShop application deployed using Docker and Jenkins CI/CD pipeline.

## Repository
Source: https://github.com/sriram-R-krishnan/devops-build

## Infrastructure
- AWS EC2 t2.micro (Amazon Linux 2023)
- Ports: 80 (App), 8080 (Jenkins), 3001 (Monitoring)
- Security Group: Port 22 restricted to admin IP only

## Docker Setup
- Base Image: nginx:alpine
- App served on port 80
- docker-compose for container orchestration

## Bash Scripts
- build.sh - Builds Docker image with tag
- deploy.sh - Stops existing container and deploys new image

## DockerHub Repositories
- Dev: rajdevops5/devops-project-3-build-dev (Public)
- Prod: rajdevops5/devops-project-3-build-prod (Private)

## Jenkins Pipeline
- Declarative pipeline with 4 stages: Checkout, Build, Push, Deploy
- GitHub webhook triggers auto build on every commit
- Dev branch push - image pushed to dev DockerHub repo
- Master branch push - image pushed to prod DockerHub repo

## Monitoring
- Uptime Kuma running on port 3001
- Monitors app health every 60 seconds
- 100% uptime tracking with response time metrics

## Deployed Site
http://15.206.127.62

## Screenshots
All screenshots available in the repository.
