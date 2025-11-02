#!/bin/bash
<<<<<<< HEAD
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger
# Script de vérification du code (solve)
# Vérifie qu’un code a été saisi
if [[ -z "$1" ]]; then
  echo
  echo "⚠️  Utilisation : ./verification_passe.sh <code>"
  echo "Exemple : ./verification_passe.sh 12:00"
  echo
  exit 1
fi
=======
# Vérifie la solution du joueur
>>>>>>> 53515d9ddc3e4d365bdeb00ee3eb4cf3c7e7a254

reponse="$1"

if [[ "$reponse" == "12:00" || "$reponse" == "12h00" || "$reponse" == "00:00" ]]; then
  echo
  echo "✅ Le code est correct."
  echo "L'horloge commence à vibrer... tic... tac..."
  sleep 1
  echo "🕰️ Le passé respire à nouveau !"
  echo "Les engrenages reprennent vie, la poussière tombe..."
  sleep 1
  echo
  echo "🎉 Chapitre 1 réussi ! Le passage vers le Présent s'ouvre..."
  pkill -P $$ 2>/dev/null
  exit 0
else
  echo
  echo "❌ Mauvais code. L'horloge reste immobile..."
  echo "Les aiguilles vous narguent dans leur silence..."
  exit 1
fi



