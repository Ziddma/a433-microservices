#!/bin/bash

# Masukkan username GitHub Anda
DOCKER_USERNAME="ziddma"

# Login ke GitHub Container Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u $DOCKER_USERNAME --password-stdin

# Build Docker image untuk shipping-service
docker build -t ghcr.io/$DOCKER_USERNAME/shipping-service:latest .

# Push image ke GitHub Container Registry
docker push ghcr.io/$DOCKER_USERNAME/shipping-service:latest