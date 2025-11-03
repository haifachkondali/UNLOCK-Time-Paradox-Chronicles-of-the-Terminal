#!/bin/bash
# remise_zero.sh — réinitialise le module PRÉSENT

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

TIME_FILE="$SCRIPT_DIR/time"
PID_FILE="$SCRIPT_DIR/.present_timer.pid"
CORE_PID_FILE="$SCRIPT_DIR/.chrono_core.pid"

echo "🔄 Réinitialisation du module Présent..."
sleep 1

# Tue les processus encore actifs
for file in "$PID_FILE" "$CORE_PID_FILE"; do
  if [[ -f "$file" ]]; then
    pid=$(cat "$file" 2>/dev/null)
    if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then
      kill "$pid" 2>/dev/null
      sleep 0.2
    fi
    rm -f "$file"
  fi
done

# Supprime les fichiers extraits si présents
rm -f "$SCRIPT_DIR"/secure_data.txt 2>/dev/null

# Réinitialise le sablier
echo "10:00" > "$TIME_FILE"

echo
echo "🧹 Le laboratoire retrouve son état initial."
echo "Vous pouvez relancer le module avec : ./start_present.sh"
echo

