#!/bin/bash
set +x
count1=0
count2=0

# option -s curl: 

for i in {1..499}; do
	resp=$(curl -s http://localhost:83)
	[[ "$resp" == "<h1>Hello 1</h1>" ]] && ((count1++)) || ((count2++))
done

echo "Serveur 1 : $count1"
echo "Serveur 2 : $count2"

