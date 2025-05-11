#!/bin/bash

# Masukkan username GitHub Anda
DOCKER_USERNAME="ziddma"

# Login ke GitHub Container Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u $DOCKER_USERNAME --password-stdin

# Build Docker image untuk order-service
docker build -t ghcr.io/$DOCKER_USERNAME/order-service:latest .

# Push image ke GitHub Container Registry
docker push ghcr.io/$DOCKER_USERNAME/order-service:latest