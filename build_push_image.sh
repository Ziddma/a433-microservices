#!/bin/bash

# Nama image dan tag
IMAGE_NAME="item-app"
TAG="v1"
GITHUB_USERNAME="ziddma"
GITHUB_REPO="a433-microservices"

# Tag lengkap untuk GitHub Container Registry
FULL_IMAGE="ghcr.io/$GITHUB_USERNAME/$GITHUB_REPO/$IMAGE_NAME:$TAG"

# Build image dari Dockerfile
docker build -t $IMAGE_NAME:$TAG .

# Menampilkan daftar image lokal
docker images

# Tag image ke format GHCR
echo "Menandai image sebagai $FULL_IMAGE"
docker tag $IMAGE_NAME:$TAG $FULL_IMAGE

# Login ke GitHub Container Registry
echo "Masukkan Personal Access Token GitHub:"
docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push image ke GHCR
docker push $FULL_IMAGE
