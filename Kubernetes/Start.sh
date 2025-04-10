#!/bin/bash

echo "Création des déploiements..."
kubectl apply -f frontend-configmap.yml
kubectl apply -f redis-deployment.yml
kubectl apply -f redis-replica-deployment.yml
kubectl apply -f metrics-server.yaml
kubectl apply -f serveur-deployment.yml
kubectl apply -f horizontalpod.yml
kubectl apply -f front-deployment.yml
kubectl apply -f prometheus-deployment.yml
kubectl apply -f graphana.yml


# Attendre que les services soient bien créés avant de mettre à jour le ConfigMap
sleep 10

echo "Lancement du script pour récupérer l'IP du serveur..."
./update-configmap.sh

