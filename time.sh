#!/bin/bash
# Module TEMPS – Gère le décompte réel du temps

DURATION=$((10 * 60))   # 10 minutes réelles
START_FILE=".start_time"

if [[ ! -f "$START_FILE" ]]; then
  date +%s > "$START_FILE"
fi

START_TIME=$(cat "$START_FILE")
CURRENT_TIME=$(date +%s)
ELAPSED=$((CURRENT_TIME - START_TIME))
REMAINING=$((DURATION - ELAPSED))

if (( REMAINING <= 0 )); then
  echo "💥 Le temps s'est écoulé ! Vous êtes piégé dans la boucle temporelle."
  echo "Essayez 'remise zero' pour recommencer."
  exit 1
else
  MINUTES=$((REMAINING / 60))
  SECONDS=$((REMAINING % 60))
  printf "⏳ Temps restant : %02d:%02d\n" "$MINUTES" "$SECONDS"
  exit 0
fi
