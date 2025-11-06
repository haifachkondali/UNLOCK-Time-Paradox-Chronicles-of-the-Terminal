#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger
# Vérification complète du module PASSÉ

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INDICES_DIR="$SCRIPT_DIR/indices"
HORLOGE_FILE="$INDICES_DIR/02_horloge.txt"

# ───────────────────────────────
# Vérifie qu’un code a été saisi
# ───────────────────────────────
if [[ -z "$1" ]]; then
  echo
  echo "⚠️  Utilisation : ./06_verification_passe.sh <code>"
  echo "Exemple : ./06_verification_passe.sh HH:MM"
  echo
  exit 1
fi

reponse="$1"

# ───────────────────────────────
# Étape 1 : Vérifier l’existence du dossier indices/
# ───────────────────────────────
if [[ ! -d "$INDICES_DIR" ]]; then
  echo
  echo "❌ Le dossier 'indices/' est introuvable."
  echo "Le château reste plongé dans le désordre..."
  echo "Astuce : créez-le avec → mkdir "
  echo
  exit 1
fi

# ───────────────────────────────
# Étape 2 : Vérifier que les fichiers .txt sont bien rangés dedans
# ───────────────────────────────
txt_count=$(find "$INDICES_DIR" -maxdepth 1 -name "*.txt" | wc -l)
if (( txt_count == 0 )); then
  echo
  echo "❌ Aucun fichier d’indice n’a été rangé dans le dossier."
  echo "Le château murmure : 'Remets de l’ordre dans mes secrets...' "
  echo "Astuce : déplace les fichiers avec → mv"
  echo
  exit 1
fi

# ───────────────────────────────
# Étape 3 : Vérifier le contenu de l’horloge
# ───────────────────────────────
if [[ ! -f "$HORLOGE_FILE" ]]; then
  echo
  echo "❌ L’horloge est introuvable parmi les indices..."
  echo "Astuce : vérifiez que '02_horloge.txt' est bien dans le dossier 'indices/'."
  echo
  exit 1
fi

contenu="$(cat "$HORLOGE_FILE" | tr -d '[:space:]')"  # retire espaces et retours à la ligne
if [[ "$contenu" != "12:00" && "$contenu" != "00:00" ]]; then
  echo
  echo "❌ L’horloge n’indique pas la bonne heure."
  echo "Astuce : utilisez la commande → echo \"HH:MM\" "
  echo
  exit 1
fi

# ───────────────────────────────
# Étape 4 : Vérification du code saisi par le joueur
# ───────────────────────────────
if [[ "$reponse" == "12:00" ||"$reponse" == "00:00" ]]; then
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
  echo "Un bruit sourd résonne dans la pièce, l’horloge reste immobile..."
  echo "Les aiguilles vous narguent dans leur silence..."
  echo
  exit 1
fi
