#!/bin/bash

# Ce script lance le producteur puis surveille la taille de la file Redis.
# Si la charge augmente, il lance un nouveau consommateur en arriere-plan.

TERM="xfce4-terminal"
iter=0
oldnb=0

$TERM -t PRODUCER -e ./producer.sh

while :
do
    nbjobs=$(jobs | grep Running | wc -l)
    echo "Nb jobs en cours: $nbjobs"

    nb=$(redis-cli --raw LLEN mafile)
    iter=$((iter+1))
    echo "- iter $iter, taille liste=$nb"

    if [ "$nb" -gt "$oldnb" ]
    then
        ./consumer.sh &
    fi

    oldnb=$nb
    sleep 3
done
