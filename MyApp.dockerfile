# Utiliser une image de base avec Python
FROM python:3.9-slim-buster

# Mettre à jour les packages et installer les dépendances
RUN apt-get update && apt-get install -y build-essential

# Créer le répertoire de travail
WORKDIR /app

# Copier les fichiers de l'application dans le conteneur
COPY requirements.txt .
COPY app.py .

# Installer les dépendances Python
RUN pip install -r requirements.txt

# Exposer le port 5000 pour accéder à l'application
EXPOSE 5000

# Démarrer l'application Flask
CMD [ "python", "./app.py" ]
