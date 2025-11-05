#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger
# Vérification du code temporel

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HORLOGE_FILE="$SCRIPT_DIR/02_horloge.txt"

# Vérifie qu’un code a été saisi
if [[ -z "$1" ]]; then
  echo
  echo "⚠️  Utilisation : ./07_verification_passe.sh <code>"
  echo "Exemple : ./07_verification_passe.sh HH:MM"
  echo
  exit 1
fi

reponse="$1"

# ───────────────────────────────
# Étape 1 : Vérifier le contenu de l’horloge
# ───────────────────────────────
if [[ ! -f "$HORLOGE_FILE" ]]; then
  echo "❌ Fichier d’horloge introuvable. Avez-vous lancé le module ?"
  exit 1
fi

contenu="$(cat "$HORLOGE_FILE" | tr -d '[:space:]')"  # retire les espaces et retours à la ligne

if [[ "$contenu" != "12:00" && "$contenu" != "12h00" && "$contenu" != "00:00" ]]; then
  echo
  echo "❌ L'horloge n’indique pas la bonne heure."
  echo "Astuce : utilisez la commande → echo \"HH:MM\" > 02_horloge.txt"
  echo
  exit 1
fi

# ───────────────────────────────
# Étape 2 : Vérification de la saisie du joueur
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
