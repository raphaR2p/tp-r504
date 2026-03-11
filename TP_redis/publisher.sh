#!/bin/bash

# Ce script envoie un message dans un canal

CHANNEL="canal1"
MESSAGE="$1"

# Vérifie qu'un message a bien été donné en argument
if [ -z "$MESSAGE" ]; then
    echo "Usage : ./publisher.sh \"votre message\""
    exit 1
fi

# Vérifie que Redis répond avant d'envoyer le message.
# Ca évite une erreur si le service n'est pas démarré.
if redis-cli ping > /dev/null 2>&1; then
    echo "Envoi du message sur le canal $CHANNEL"
    redis-cli PUBLISH "$CHANNEL" "$MESSAGE"
else
    echo "Erreur : Redis ne répond pas"
    exit 1
fi
