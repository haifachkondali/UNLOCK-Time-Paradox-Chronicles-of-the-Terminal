#!/bin/bash
# Remise à zéro du module FUTUR

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

echo "🔄 Réinitialisation du module Futur..."
sleep 1

PID_FILE="$SCRIPT_DIR/.quantum_core.pid"
TIME_FILE="$SCRIPT_DIR/time"
PING_FILE="$SCRIPT_DIR/.ping_ok"

# 1️⃣ Stoppe le processus parasite
if [[ -f "$PID_FILE" ]]; then
  pid=$(cat "$PID_FILE")
  if [[ -n "$pid" ]]; then
    kill "$pid" 2>/dev/null
  fi
  rm -f "$PID_FILE"
fi

# 2️⃣ Réinitialise le ping et le temps
rm -f "$PING_FILE"
echo "10:00" > "$TIME_FILE"

# 3️⃣ Supprime le dossier backup si présent
rm -rf "$SCRIPT_DIR/backup"

# 4️⃣ Message immersif
echo
echo "🧘 Le flux du futur est effacé. Tout est silencieux à nouveau."
echo "Relance le cycle avec : ./start_futur.sh"
echo
