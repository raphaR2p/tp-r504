#!/bin/bash

# Envoie des valeurs aleatoires dans la liste Redis "mafile".

PARAM=s_redis
LISTNAME="mafile"
BURST=1000
DELAY_BURST=3

redis-cli -h $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connexion avec le serveur Redis !"
    exit 1
fi

while :
do
    for ((i=0; i<BURST; i++))
    do
        redis-cli -h $PARAM LPUSH "$LISTNAME" $RANDOM >/dev/null
    done

    size=$(redis-cli -h $PARAM --raw LLEN "$LISTNAME")
    echo "Taille actuelle de la file : $size"

    sleep $DELAY_BURST
done
