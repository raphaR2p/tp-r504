#!/bin/bash

# Lit les valeurs de la liste Redis "mafile".

PARAM=s_redis
LISTNAME="mafile"
THRESHOLD=30000
DELAY_EMPTY=2
DELAY_ALARM=4

redis-cli -h $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connexion avec le serveur Redis !"
    exit 1
fi

while :
do
    nb=$(redis-cli -h $PARAM --raw LLEN "$LISTNAME")

    if [ "$nb" -gt 0 ]
    then
        value=$(redis-cli -h $PARAM --raw RPOP "$LISTNAME")
        echo "Valeur recue : $value"

        if [ "$value" -gt "$THRESHOLD" ]
        then
            echo "ALARME!"
            sleep $DELAY_ALARM
        fi
    else
        echo "Liste vide, attente 2s."
        sleep $DELAY_EMPTY
    fi
done
