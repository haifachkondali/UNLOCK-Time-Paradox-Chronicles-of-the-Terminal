#!/bin/bash
# Remise à zéro du module FUTUR

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

echo "🔄 Réinitialisation du module Futur..."
sleep 1

PID_FILE="$SCRIPT_DIR/.quantum_core.pid"
TIME_FILE="$SCRIPT_DIR/time"

# 1) Stoppe le processus parasite
if [[ -f "$PID_FILE" ]]; then
  pid=$(cat "$PID_FILE")
  if [[ -n "$pid" ]]; then
    kill "$pid" 2>/dev/null
  fi
  rm -f "$PID_FILE"
fi

# 2) Réinitialise le fichier time
echo "10:00" > "$TIME_FILE"

# 3) Supprime le dossier backup si présent
rm -rf "$SCRIPT_DIR/backup"

echo
echo "🧘 Le flux du futur est effacé. Tout est silencieux à nouveau."
echo "Relance le cycle avec : ./start_futur.sh"
