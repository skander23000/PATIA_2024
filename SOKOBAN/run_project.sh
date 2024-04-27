#!/bin/bash


echo "Lancement des commandes Maven..."
mvn clean
if [ $? -ne 0 ]; then
    echo "La commande mvn clean a échoué."
    exit 1
fi

mvn compile
if [ $? -ne 0 ]; then
    echo "La commande mvn compile a échoué."
    exit 1
fi

mvn test
if [ $? -ne 0 ]; then
    echo "La commande mvn test a échoué."
    exit 1
fi

mvn package
if [ $? -ne 0 ]; then
    echo "La commande mvn package a échoué."
    exit 1
fi

# Récupère le nom du test en paramètre ou utilise 'test1' par défaut
TEST_NAME="${1:-test1}"

echo "Exécution de l'application Java avec le fichier $TEST_NAME.json..."
java --add-opens java.base/java.lang=ALL-UNNAMED \
     -server -Xms2048m -Xmx2048m \
     -cp target/sokoban-1.0-SNAPSHOT-jar-with-dependencies.jar \
     sokoban.SokobanMain "$TEST_NAME.json"

if [ $? -ne 0 ]; then
    echo "L'exécution de l'application Java a échoué."
    exit 1
fi

echo "Terminé avec succès."
