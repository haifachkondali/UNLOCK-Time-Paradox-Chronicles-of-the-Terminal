#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger
# Vérification du code temporel

# Vérifie qu’un code a été saisi
if [[ -z "$1" ]]; then
  echo
  echo "⚠️  Utilisation : ./verification_passe.sh <code>"
  echo "Exemple : ./verification_passe.sh 12:00"
  echo
  exit 1
fi

reponse="$1"

# ───────────────────────────────
# Vérification de la solution
# ───────────────────────────────
if [[ "$reponse" == "12:00" || "$reponse" == "12h00" || "$reponse" == "00:00" ]]; then
  echo
  echo "✅ Le code est correct."
  echo "L'horloge commence à vibrer légèrement..."
  sleep 1
  echo -n "⌛ tic..."; sleep 1
  echo " tac..."
  sleep 1
  echo -n "⌛ tic..."; sleep 1
  echo " tac..."
  sleep 1
  echo
  echo "🕰️  L'horloge se remet à tictaquer. Le passé respire à nouveau !"
  echo "Les engrenages tournent... la poussière tombe... le temps se remet en marche."
  echo
  echo "🎉 Chapitre 1 réussi ! Le passage vers le Présent s'ouvre..."
  echo "────────────────────────────────────────────────────────────"
  echo
  exit 0
else
  echo
  echo "❌ Code incorrect."
  echo "Un bruit sourd résonne dans la pièce, l'horloge reste immobile..."
  echo "Les aiguilles vous narguent dans leur silence..."
  echo
  exit 1
fi
