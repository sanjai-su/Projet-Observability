# Projet AutoScaling et IaC

Pour créer l'infrastructure, nous avons mis en place des scripts d'automatisation.
Pour pouvoir les utiliser placez vous dans le repertoire Kubernetes.
Penser a faire chmod +x sur les scripts pour donner les droits d'execution.

## Étapes à suivre :

### 1. Lancer le tunnel

Exécutez le script suivant dans un terminal :

```bash
./Tunnel.sh
```

Attendez que le tunnel soit **bien lancé** avant de passer à l'étape suivante.

---

### 2. Démarrer l'infrastructure

Une fois le tunnel actif, exécutez cette commande dans un autre terminal different de celui du tunnel:

```bash
./Start.sh
```
Il est possible que les deploiments mettent du temps a ce lancer.
Bien verifier que tous les pods soit ready.
---

### 3. Tester le comportement de l’autoscaler

Un script Bash développé pour générer de la charge artificielle sur le backend (via des requêtes curl en boucle). Il permet de tester le comportement de l’autoscaler et de vérifier que le nombre de pods augmente bien automatiquement lorsque la charge est
élevée.

Dans un terminal on lance
```bash
kubectl get hpa -A
```

Puis dans un autre on lance le script, stress-backend.sh :


```bash
./stress-backend.sh
```

Apres avoir lancer stress-backend, lancer plusieurs fois la commande kubectl get hpa -A car au début, le nombre de réplicas est minimal, mais au bout d’un certain temps, l’augmentation de l’utilisation du CPU entraîne automatiquement le déploiement de réplicas supplémentaires.
---

### 4. Accéder au front-end

Pour tester le front :

- Utilisez la commande suivante pour récupérer l'IP et le port du service :

  ```bash
  kubectl get services
  ```

- Repérez l’IP externe et le port du service front.

- Ouvrez votre navigateur à l’adresse suivante :

  ```
  http://<IP>:<PORT>
  ```

Vous aurez accès à l'interface front.

---

### 5. Accéder à Prometheus

Même manipulation que pour le front :

- Récupérez l’IP et le port du service Prometheus :

  ```bash
  kubectl get services
  ```

- Ouvrez votre navigateur à :

  ```
  http://<IP>:9090
  ```

---

### 6. Accéder à Grafana

Même manipulation que pour le front :

- Récupérez l’IP et le port du service Grafana :

  ```bash
  kubectl get services
  ```

- Ouvrez votre navigateur à :

  ```
  http://<IP>:3000
  ```

---
