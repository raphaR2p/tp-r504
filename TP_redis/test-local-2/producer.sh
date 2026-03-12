#!/bin/bash

# Ce script = producteur.
# Genere des valeurs aleatoires et les ajoute dans une liste Redis nommee "mafile".
# Envoi 1000 par 1000 toutes les 3 secondes.

LISTNAME="mafile"
BURST=1000
DELAY_BURST=3

# Verification connexion avec Redis.
redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    exit 1
fi

while :
do
    for ((i=0; i<BURST; i++))
    do
        redis-cli LPUSH "$LISTNAME" $RANDOM >/dev/null
    done

    size=$(redis-cli --raw LLEN "$LISTNAME")
    echo "Taille actuelle de la file : $size"

    sleep $DELAY_BURST
done
