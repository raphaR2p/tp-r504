#!/bin/bash

docker stop nginx1 nginx2 nginx-lb
docker network rm tplb

