#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 3 : Le Futur – L’Ordinateur Quantique
# Version immersive avec logique de progression narrative

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

clear
echo "══════════════════════════════════════════════"
echo " ÉPOQUE : Le Futur – L’Ordinateur Quantique "
echo "══════════════════════════════════════════════"
echo
echo "Le terminal s’illumine dans un éclat bleu."
echo "Un cœur d’IA, « QUANTUM CORE », pulse dans le vide..."
echo
echo "Une voix synthétique murmure :"
echo "⚠️  « Un processus parasite a pris le contrôle du temps."
echo "    Trouve-le. Détruis-le. Restaure le flux. »"
echo
sleep 3

# ───────────────────────────────
# Lancer le processus parasite
# ───────────────────────────────
bash "$SCRIPT_DIR/quantum_core.sh" & echo $! > "$SCRIPT_DIR/.quantum_core.pid"

# ───────────────────────────────
# Initialiser le timer
# ───────────────────────────────
DURATION=$((10*60))
START_TS=$(date +%s)
TIME_FILE="$SCRIPT_DIR/time"
PID_FILE="$SCRIPT_DIR/.futur_timer.pid"
: > "$TIME_FILE"

update_time_file() {
  while : ; do
    now=$(date +%s)
    rem=$(( DURATION - (now - START_TS) ))
    if (( rem <= 0 )); then
      printf "00:00\n" > "$TIME_FILE"
      break
    fi
    m=$(( rem / 60 ))
    s=$(( rem % 60 ))
    printf "%02d:%02d\n" "$m" "$s" > "$TIME_FILE"
    sleep 1
  done
}

update_time_file & echo $! > "$PID_FILE"
disown $(cat "$PID_FILE") 2>/dev/null

echo
echo "💡 Commandes utiles :"
echo "  ls, cat, grep, htop, ps aux, kill, vi, tar, diff, ping, cat time"
echo
echo "──────────────────────────────────────────────"
echo "Objectif : Corrige le protocole et restaure les données quantiques."
echo "──────────────────────────────────────────────"
