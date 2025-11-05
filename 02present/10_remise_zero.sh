#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 2 : Le Présent – Le Laboratoire Éteint
# Remise à zéro complète du module PRÉSENT

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

TIME_FILE="$SCRIPT_DIR/time"
PID_FILE="$SCRIPT_DIR/.present_timer.pid"
CORE_PID_FILE="$SCRIPT_DIR/.chrono_core.pid"
USERS_FILE="$SCRIPT_DIR/04_users.conf"
CHRONO_SCRIPT="$SCRIPT_DIR/06_chrono_core.sh"

echo "🔄 Réinitialisation du module Présent..."
sleep 1

# ───────────────────────────────
# 1) Tuer tous les processus actifs (timer + core)
# ───────────────────────────────
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

# ───────────────────────────────
# 2) Réinitialiser le fichier users.conf
# ───────────────────────────────
if [[ -f "$USERS_FILE" ]]; then
  echo "🔧 Restauration du fichier des utilisateurs..."
  # Supprime la ligne "technician" s’il a été ajouté
  grep -vi "technician" "$USERS_FILE" > "$USERS_FILE.tmp" && mv "$USERS_FILE.tmp" "$USERS_FILE"
  sleep 1
fi

# ───────────────────────────────
# 3) Réinitialiser le sablier
# ───────────────────────────────
echo "10:00" > "$TIME_FILE"

# ───────────────────────────────
# 4) Relancer le processus parasite 'chrono_core'
# ───────────────────────────────
if [[ -f "$CHRONO_SCRIPT" ]]; then
  echo "⚙️  Relance du processus temporel 'chrono_core'..."
  bash "$CHRONO_SCRIPT" & echo $! > "$CORE_PID_FILE"
  sleep 1
else
  echo "⚠️  Fichier chrono_core.sh introuvable — impossible de relancer le cœur temporel."
fi

echo
echo "🧹 Le laboratoire retrouve son état initial."
echo "Vous pouvez relancer le module avec : ./start_present.sh"
echo
