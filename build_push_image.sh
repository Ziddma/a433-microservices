#!/bin/bash

# Bangun image Docker dari Dockerfile dengan nama item-app dan tag v1
docker build -t item-app:v1 .

# Tampilkan daftar image yang tersedia di lokal
docker images

# Ganti tag agar sesuai dengan GitHub Packages (ganti USERNAME dengan GitHub username Anda)
docker tag item-app:v1 ghcr.io/USERNAME/item-app:v1

# Login ke GitHub Container Registry (GitHub Packages)
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
# Note: CR_PAT adalah personal access token GitHub yang disimpan sebagai environment variable

# Push image ke GitHub Container Registry
docker push ghcr.io/USERNAME/item-app:v1
