#!/bin/bash

# Nama image dan tag
IMAGE_NAME="item-app"
TAG="v1"
GITHUB_USERNAME="ziddma"
GITHUB_REPO="a433-microservices"

# Build Docker image dari Dockerfile
docker build -t $IMAGE_NAME:$TAG .

# Melihat daftar image di lokal
docker images

# Menandai ulang image agar sesuai dengan format GitHub Container Registry
docker tag $IMAGE_NAME:$TAG ghcr.io/$GITHUB_USERNAME/$GITHUB_REPO/$IMAGE_NAME:$TAG

# Login ke GitHub Container Registry
echo "Masukkan token GitHub Anda untuk login ke GitHub Container Registry:"
docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push image ke GitHub Container Registry
docker push ghcr.io/$GITHUB_USERNAME/$GITHUB_REPO/$IMAGE_NAME:$TAG
