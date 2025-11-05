#!/bin/bash
# Remise à zéro du module FUTUR

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

echo "🔄 Réinitialisation du module Futur..."
sleep 1

PID_FILE="$SCRIPT_DIR/.quantum_core.pid"
TIME_FILE="$SCRIPT_DIR/time"
PING_FILE="$SCRIPT_DIR/.ping_ok"
BACKUP_DIR="$SCRIPT_DIR/backup"

# 1️⃣ Stoppe le processus parasite s'il reste
if [[ -f "$PID_FILE" ]]; then
  pid=$(cat "$PID_FILE")
  if [[ -n "$pid" ]]; then
    kill "$pid" 2>/dev/null
  fi
  rm -f "$PID_FILE"
fi

# 2️⃣ Réinitialise les fichiers de statut
rm -f "$PING_FILE"
echo "10:00" > "$TIME_FILE"

# 3️⃣ Supprime le dossier backup
rm -rf "$BACKUP_DIR"

# 4️⃣ Relance le Quantum Core pour le prochain joueur
nohup bash "$SCRIPT_DIR/07_quantum_core.sh" >/dev/null 2>&1 &
sleep 0.5
echo "⚙️  Quantum Core relancé pour un nouveau cycle."

# 5️⃣ Message immersif
echo
echo "🧘 Le flux du futur est effacé. Tout est silencieux à nouveau."
echo "Relance le cycle avec : ./01_start_futur.sh"
echo

