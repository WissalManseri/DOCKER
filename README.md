
# Docker (Application web Python Flask dans Docker)


Ce programme permet de créer une image Docker pour une application web Python Flask. L'image Docker peut ensuite être utilisée pour exécuter l'application dans un conteneur Docker.

# Prérequis :

Pour exécuter ce programme, vous devez disposer des éléments suivants :

- Docker : Vous devez avoir Docker installé sur votre système. Si vous ne l'avez pas encore installé, vous pouvez suivre les instructions d'installation à partir du site web de Docker : https://www.docker.com/get-started

- Code source de l'application : Vous devez avoir le code source de votre application web Python Flask. Si vous n'avez pas encore écrit votre application, vous pouvez en créer une à partir d'un exemple ou en suivant un tutoriel. Voici un exemple simple d'application Flask :

      from flask import Flask

      app = Flask(__name__)

      @app.route('/')
      def hello_world():
          return 'Hello, World!'
          
- Fichier requirements.txt : Vous devez avoir un fichier requirements.txt contenant les dépendances Python nécessaires pour exécuter votre application. Si vous n'avez pas encore créé ce fichier, vous pouvez le créer à l'aide de la commande suivante :

    pip freeze > requirements.txt

# Création de l'image Docker :

Pour créer l'image Docker pour votre application Python Flask, vous devez suivre les étapes suivantes :

1. Créez un fichier Dockerfile dans le même répertoire que votre code source Flask.

2. Copiez et collez le code suivant dans votre Dockerfile :



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
      
3. Modifiez le Dockerfile selon vos besoins. 

   Par exemple, vous pouvez remplacer python:3.9-slim-buster par une autre image de base si vous préférez une version différente de Python.

4. Ouvrez une fenêtre de terminal et naviguez jusqu'au répertoire contenant votre Dockerfile et votre code source Flask.

5. Exécutez la commande suivante pour créer l'image Docker :


       docker build -t nom_image_docker .
  
  RMQ/ Assurez-vous de remplacer nom_image_docker par un nom unique pour votre image Docker.

6. Une fois que l'image Docker est créée, vous pouvez exécuter votre application web en utilisant la commande suivante :

            docker run -p 5000:5000 nom_image_docker
  
 RMQ/ Cette commande exécute un conteneur Docker à partir de l'image que vous venez de créer,
  en redirigeant le port 5000 du conteneur vers le port 5000 de votre machine locale.

7. Accédez à votre application web en ouvrant un navigateur et en accédant à adresse suivante :
 http://localhost:5000. Vous devriez voir le message "Hello, World!" s'afficher dans votre navigateur.

# Personnalisation de l'image Docker
  
  Vous pouvez personnaliser votre image Docker en ajoutant des packages supplémentaires, des fichiers de configuration ou des scripts d'initialisation.

  Voici quelques exemples de personnalisation que vous pouvez effectuer :

- Ajouter des packages supplémentaires : vous pouvez installer des packages supplémentaires en utilisant la commande RUN apt-get install ou RUN pip install dans votre   Dockerfile.


- Ajouter des fichiers de configuration : vous pouvez copier des fichiers de configuration dans le conteneur en utilisant la commande COPY dans votre Dockerfile.


- Exécuter des scripts d'initialisation : vous pouvez exécuter des scripts d'initialisation au démarrage du conteneur en utilisant la commande CMD dans votre    Dockerfile.


# Conclusion
   La création d'une image Docker pour une application web Python Flask est un moyen pratique de distribuer et d'exécuter votre application dans des environnements isolés et reproductibles.
