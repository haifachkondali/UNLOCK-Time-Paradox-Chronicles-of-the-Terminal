#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger
# Script de remise à zéro complet du module "Passé"

# Répertoire du script (robuste)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

TIME_FILE="$SCRIPT_DIR/time"
PID_FILE="$SCRIPT_DIR/.timer.pid"

echo "🔄 Réinitialisation du module en cours..."
sleep 1

# 1) Couper le timer en cours s'il tourne
if [[ -f "$PID_FILE" ]]; then
  pid="$(cat "$PID_FILE" 2>/dev/null)"
  if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then
    kill "$pid" 2>/dev/null
    sleep 0.2
  fi
  rm -f "$PID_FILE"
fi

# 2) Réinitialiser le temps (valeur affichée au prochain lancement)
echo "10:00" > "$TIME_FILE"

# 3) Rangement inverse : remettre les .txt à la racine et supprimer indices/
if [[ -d "$SCRIPT_DIR/indices" ]]; then
  echo "🧹 Le manoir efface toute trace du précédent voyage..."
  sleep 1
  mv "$SCRIPT_DIR"/indices/*.txt "$SCRIPT_DIR"/ 2>/dev/null
  rm -rf "$SCRIPT_DIR/indices"
  sleep 1
else
  echo "⚠️  Aucun souvenir à effacer... Le manoir semble déjà vide."
  sleep 1
fi

echo
echo "⏳ Le sablier se renverse..."
sleep 1
echo "Le temps recommence à s’écouler, et le manoir retrouve son calme."
echo
echo "Vous pouvez relancer le jeu avec :"
echo "  ./start_passe.sh"
echo
