#!/bin/bash

# Charger les variables d'environnement depuis le fichier .env
source .env
isExecuted=0
# Récupérer le chemin d'accès absolu du script
script_path=$(readlink -f "$0")

# Extraire le répertoire parent du script
script_dir=$(dirname "$script_path")
if [ -z "$REPO_URL_CRUD" ] || [ -z "$BRANCH_NAME_CRUD" ]; then
    # Si l'une des variables n'est pas définie, afficher un message d'erreur et quitter le script
    echo "ERREUR : Les variables d'environnement REPO_URL et BRANCH_NAME doivent être définies dans le fichier .env"
    exit 1
fi

if [ -z "$(ls -A ./ServiceCrud/symfony)" ]; then
    # Si le répertoire est vide, on fait un git clone
    git clone -b $BRANCH_NAME_CRUD $REPO_URL_CRUD  ./ServiceCrud/symfony
    composer install
    isExecuted=1
else
    # Si le répertoire n'est pas vide, on fait un git pull
    cd ./ServiceCrud/symfony
    git pull origin $BRANCH_NAME_CRUD 
    composer install
    isExecuted=1

fi
if [ "$isExecuted" -eq 1 ]; then
    cd  $script_dir
    echo $PWD
    docker-compose up
fi


