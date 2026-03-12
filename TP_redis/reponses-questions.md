# Questions / Réponses - Mini Projet Redis

## Question 2.7

Quand on lance les scripts `producer.sh` et `consumer.sh`, on voit que la taille de la file Redis augmente progressivement.

Le producer envoie des valeurs aléatoires dans la liste Redis `mafile` 1000 par 1000 toutes les 3 secondes.
Le consumer, lui, traite les valeurs une par une.

Quand une valeur dépasse 30000, une alarme est déclenchée et le consumer attend 4 secondes avant de continuer le traitement.

---

## Question 2.8

Quand on lance plusieurs scripts `consumer.sh` en parallèle, plusieurs consommateurs retirent des valeurs de la liste Redis en même temps.

Cela permet d'augmenter la vitesse de traitement des valeurs présentes dans la file.

On observe alors que la taille de la file Redis augmente moins vite, et peut même se stabiliser si la consommation devient suffisante.

ca peut améliorer les performances du traitement en ajoutant plusieurs consommateurs.


## Question 2.15

En lançant le script run.sh, on observe que le nombre de consommateurs augmente lorsque la taille de la file Redis augmente.

Le nombre maximal dépend des conditions d'exécution et des performances de la machine.
Il peut être observé avec la commande `ps aux | grep consumer` ou avec l'affichage du nombre de jobs.

## Question 2.16

L'inconvénient de cette stratégie est qu'elle lance facilement trop de consommateurs.
En effet, dès que la taille de la file est supérieure à celle de l'itération précédente, un nouveau consumer est créé.
Le système peut donc sur-réagir à une hausse temporaire de charge.

Une autre stratégie serait d'utiliser des seuils de taille de file pour décider du nombre de consommateurs à lancer, ou de vérifier l'évolution de la charge sur plusieurs itérations avant de démarrer une nouvelle instance.
