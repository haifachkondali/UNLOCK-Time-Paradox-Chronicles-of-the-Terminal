#!/bin/bash
# chrono_core.sh – Processus parasite du PRÉSENT (version stable)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PIDFILE="$SCRIPT_DIR/.chrono_core.pid"

# Si déjà actif, on ne recrée pas
if [[ -f "$PIDFILE" ]]; then
  oldpid=$(cat "$PIDFILE" 2>/dev/null)
  if [[ -n "$oldpid" ]] && kill -0 "$oldpid" 2>/dev/null; then
    echo "⚠️  Chrono Core déjà actif (PID $oldpid)."
    exit 0
  else
    rm -f "$PIDFILE" 2>/dev/null
  fi
fi

# Enregistre le PID réel du processus
echo $$ > "$PIDFILE"

# Nettoyage automatique à la mort du processus
_cleanup() {
  rm -f "$PIDFILE" 2>/dev/null
  exit 0
}
trap _cleanup EXIT TERM INT

# Optionnel : message discret au démarrage (utile pour debug)
# echo "Chrono Core démarré (PID $$)."

# Boucle parasite simulant une activité infinie
while :; do
  sleep 2
done
