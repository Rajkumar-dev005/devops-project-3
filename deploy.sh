#!/bin/bash
IMAGE_NAME=$1
TAG=$2
echo "Stopping existing container if running..."
docker stop devops-app 2>/dev/null || true
docker rm devops-app 2>/dev/null || true
echo "Deploying $IMAGE_NAME:$TAG..."
docker run -d --name devops-app -p 80:80 $IMAGE_NAME:$TAG
echo "Deployment complete! App running on port 80"
