#!/bin/bash
# verification_present.sh
# Vérifie si le joueur a :
#  - extrait les données
#  - arrêté le processus chrono_core

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PID_FILE="$SCRIPT_DIR/.chrono_core.pid"
BACKUP_FILE="$SCRIPT_DIR/secure_data.txt"

echo
echo "🔍 Analyse du flux temporel en cours..."
sleep 1

# Étape 1 — Vérifie si le backup a été extrait
if [[ ! -f "$BACKUP_FILE" ]]; then
  echo "⚠️  Les données de sauvegarde n'ont pas encore été restaurées."
  echo "Essayez : tar -xvf data_backup.tar.gz"
  echo
  exit 1
fi

# Étape 2 — Vérifie le processus
if [[ ! -f "$PID_FILE" ]]; then
  echo "❌ Aucun processus à analyser. Le cœur temporel est introuvable."
  echo
  exit 1
fi

PID=$(cat "$PID_FILE")

if kill -0 "$PID" 2>/dev/null; then
  echo "⚠️  Anomalie persistante : le processus 'chrono_core' est toujours actif."
  echo "Indice : un simple 'kill $PID' pourrait résoudre le problème..."
  echo
  exit 1
else
  echo "✅ Processus 'chrono_core' arrêté avec succès !"
  echo "🔒 Le flux temporel se stabilise..."
  echo
  echo "💫 Le présent est rétabli. Le manoir respire à nouveau."
  echo
  rm -f "$PID_FILE"
  exit 0
fi
