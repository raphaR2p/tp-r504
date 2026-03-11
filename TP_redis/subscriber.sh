#!/bin/bash

# Qd je le lance,il reste actif et attend les messages envoyés sur ce canal
# Redis = broker 

CHANNEL="canal1"

echo "Abonnement au canal : $CHANNEL"

# SUBSCRIBE écoute en temps réel les messages sur le canal 
redis-cli SUBSCRIBE "$CHANNEL"
