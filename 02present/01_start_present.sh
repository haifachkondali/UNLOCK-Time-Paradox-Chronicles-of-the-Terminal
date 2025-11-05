#!/bin/bash
# start_present.sh
# UNLOCK: Time Paradox – Module PRÉSENT

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

find "$SCRIPT_DIR" -maxdepth 1 -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null

clear
echo "══════════════════════════════════════════════"
echo " ÉPOQUE : Le Présent – Le Laboratoire Éteint "
echo "══════════════════════════════════════════════"
echo
echo "Les serveurs sont figés. Un terminal attend vos commandes."
echo "Un voyant rouge clignote : le flux temporel est désynchronisé."
echo
echo "Le système murmure : 'Réactivez le cœur avant que le temps ne s'effondre...'"
echo
sleep 1

# Timer
DURATION=$((10*60))
START_TS=$(date +%s)
TIME_FILE="$SCRIPT_DIR/time"
PID_FILE="$SCRIPT_DIR/.present_timer.pid"
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

sleep 9999 &
echo $! > "$SCRIPT_DIR/.chrono_core.pid"


echo
echo "💡 Vous pouvez utiliser : ls, cat, grep, ps aux, kill, tar, cat time"
echo
sleep 1
echo "──────────────────────────────────────────────"
echo "Bonne chance."
echo "──────────────────────────────────────────────"
