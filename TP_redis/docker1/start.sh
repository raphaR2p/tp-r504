#!/bin/bash

# Arrete et supprime les conteneurs existants
docker stop $(docker ps -q) 2>/dev/null
docker rm $(docker ps -aq) 2>/dev/null

# Supprime le reseau s'il existe deja
docker network rm myredis 2>/dev/null

# Cree le reseau Docker
docker network create myredis

# Construit les images
docker build -t img_cons -f Dockerfile_c .
docker build -t img_prod -f Dockerfile_p .

# Lance le serveur Redis
docker run -d \
--network myredis \
--name s_redis \
redis:latest

# Lance le consumer
docker run -d \
--network myredis \
--name s_cons \
img_cons

# Lance le producer
docker run -d \
--network myredis \
--name s_prod \
img_prod
