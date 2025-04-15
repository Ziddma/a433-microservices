#!/bin/bash

# Build Docker image dengan nama dan tag sesuai
docker build -t item-app:v1 .

# Lihat daftar image
docker images

# Retag agar sesuai dengan GitHub Container Registry tujuan
docker tag item-app:v1 ghcr.io/ziddma/a433-microservices/item-app:v1

# Login ke GitHub Container Registry (dengan PAT)
echo $CR_PAT | docker login ghcr.io -u ziddma --password-stdin

# Push image ke GitHub Container Registry
docker push ghcr.io/ziddma/a433-microservices/item-app:v1
