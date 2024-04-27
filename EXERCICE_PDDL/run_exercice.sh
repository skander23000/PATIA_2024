#!/bin/bash

# Vérifie si un nom de dossier a été passé en argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <Nom du dossier>"
    exit 1
fi

# Chemin vers le dossier contenant les fichiers PDDL
FOLDER_NAME=$1

# Commande pour lancer le planificateur
java -server -Xms4096m -Xmx4096m -cp ../SOKOBAN/libs/pddl4j-4.0.0.jar \
     fr.uga.pddl4j.planners.statespace.HSP \
     "./$FOLDER_NAME/domain.pddl" \
     "./$FOLDER_NAME/p001.pddl"
