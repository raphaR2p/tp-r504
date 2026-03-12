#!/bin/bash

# Ce script = consommateur.
# Lit les valeurs de la liste Redis "mafile".
# Si la liste est vide, il se termine.
# Si la valeur depasse le seuil, il attend 4 secondes.

LISTNAME="mafile"
THRESHOLD=30000
DELAY_ALARM=4

# Verification connexion avec Redis.
redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    # echo "Erreur, pas de connexion avec le serveur Redis !"
    exit 1
fi

while :
do
    nb=$(redis-cli --raw LLEN "$LISTNAME")

    if [ "$nb" -gt 0 ]
    then
        value=$(redis-cli --raw RPOP "$LISTNAME")
        # echo "Valeur recue : $value"

        if [ "$value" -gt "$THRESHOLD" ]
        then
            # echo "ALARME!"
            sleep $DELAY_ALARM
        fi
    else
        # echo "Liste vide."
        exit 0
    fi
done
