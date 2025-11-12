#!/bin/bash

#for i in {1..500}
#do
#    curl -s http://localhost:83
#    echo ""
#done

count1=0
count2=0

for i in {1..500}
do
    resp=$(curl -s http://localhost:83)
    if [[ "$resp" == "<h1>Hello 1</h1>" ]]; then
        count1=$((count1+1))
    else
        count2=$((count2+1))
    fi
done

echo "Serveur 1: $count1"
echo "Serveur 2: $count2"

