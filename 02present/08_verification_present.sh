#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 2 : Le Présent – Le Laboratoire Éteint
# Vérification finale du module PRÉSENT

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PID_FILE="$SCRIPT_DIR/.chrono_core.pid"
USERS_FILE="$SCRIPT_DIR/04_users.conf"

echo
echo "🔍 Analyse du flux temporel en cours..."
sleep 1

# Étape 1 — Vérifie que le processus chrono_core a bien été détruit
if [[ ! -f "$PID_FILE" ]]; then
  echo "❌ Aucun fichier PID trouvé. Le cœur temporel semble absent ou corrompu."
  echo
  exit 1
fi

PID=$(cat "$PID_FILE")

if kill -0 "$PID" 2>/dev/null; then
  echo "⚠️  Le processus 'chrono_core' est toujours actif."
  echo "Indice : utilisez 'kill $PID' pour le neutraliser."
  echo
  exit 1
else
  echo "✅ Processus 'chrono_core' arrêté avec succès."
  echo "Le flux commence à se stabiliser..."
  echo
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
  echo "Indice : ajoutez-le avec 'sudo adduser technicien'"
  echo
  exit 1
fi
