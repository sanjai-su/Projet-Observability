#!/bin/bash

# Adresse du backend (à modifier selon ton IP/port)
NEW_IP=$(kubectl get svc serveur-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
URL="http://$NEW_IP:3001"
echo "${URL}"
# Nombre de requêtes en parallèle
CONCURRENT_REQUESTS=30

echo "Lancement de $CONCURRENT_REQUESTS boucles de stress vers $URL"

for i in $(seq 1 $CONCURRENT_REQUESTS); do
  while true; do
    curl -s "$URL" > /dev/null
  done &
done

echo "Stress en cours... Appuie sur Ctrl+C pour arrêter."
wait
