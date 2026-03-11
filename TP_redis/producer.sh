#!/bin/bash

# Ce script = producteur.
# Genere des valeurs aleatoires avec RANDOM -> les ajoute dans une liste Redis nommee "mafile".
# Envoi 1000 par 1000 toutes les 3s

LISTNAME="mafile"
BURST=1000
DELAY_BURST=3

# Verification connexion avec Redis.
redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connexion avec le serveur Redis !"
    exit 1
fi

while :
do
    # Envoie 1000 valeurs aleatoires dans la liste Redis.
    for ((i=0; i<BURST; i++))
    do
        redis-cli LPUSH "$LISTNAME" $RANDOM >/dev/null
    done

    # Affiche la taille actuelle de la file.
    size=$(redis-cli --raw LLEN "$LISTNAME")
    echo "Taille actuelle de la file : $size"

    sleep $DELAY_BURST
done
