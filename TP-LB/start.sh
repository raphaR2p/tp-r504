#!/bin/bash


docker network create tplb

docker build -t im-nginx-lb ./tp-A

mkdir -p shared1 shared2
echo "<h1>Hello 1</h1>" > shared1/index.html
echo "<h1>Hello 2</h1>" > shared2/index.html

docker run -d --rm --name nginx1 -p 81:80 --network tplb -v $(pwd)/shared1:/usr/share/nginx/html nginx:latest
docker run -d --rm --name nginx2 -p 82:80 --network tplb -v $(pwd)/shared2:/usr/share/nginx/html nginx:latest
sleep 5
docker run -d --rm --name nginx-lb -p 83:80 --network tplb im-nginx-lb

