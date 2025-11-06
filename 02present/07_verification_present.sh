#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 2 : Le Présent – Vérification finale

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PID_FILE="$SCRIPT_DIR/.chrono_core.pid"
USERS_FILE="$SCRIPT_DIR/04_users.conf"

echo
echo "🔍 Analyse du flux temporel en cours..."
sleep 1

# ───────────────────────────────
# Étape 1 — Vérifie le processus ChronoCore
# ───────────────────────────────

# Si le fichier PID existe encore :
if [[ -f "$PID_FILE" ]]; then
  PID=$(cat "$PID_FILE" 2>/dev/null)
  if kill -0 "$PID" 2>/dev/null; then
    echo "⚠️  Le processus 'chrono_core' est toujours actif."
    echo "Indice : utilisez 'kill PID pour le neutraliser."
    echo
    exit 1
  else
    echo "✅ Le processus 'chrono_core' est bien arrêté."
    rm -f "$PID_FILE"
  fi
else
  echo "✅ Aucun fichier PID trouvé — le processus a été détruit."
fi

# Étape 2 — Vérifie si le technicien a bien été ajouté
if id "technicien" &>/dev/null; then
  echo "✅ L'utilisateur système 'technicien' a bien été ajouté."
  echo "L’accès au noyau du présent est restauré."
  echo
  echo "💫 Le présent est à nouveau stable. Les serveurs reprennent vie..."
  echo "──────────────────────────────────────────────"
  echo "🎉 Chapitre 2 terminé – Le passage vers le futur s'ouvre.."
  echo "──────────────────────────────────────────────"
  rm -f "$PID_FILE"
  exit 0
else
  echo "❌ Aucun technicien détecté dans le système."
  echo "Indice : ajoutez-le avec 'sudo adduser '"
  echo
  exit 1
fi
