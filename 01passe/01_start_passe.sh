#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger

# Répertoire du script (robuste, où que l’on soit)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

# 1) Vérification du dossier "indices/"
if [[ ! -d "$SCRIPT_DIR/indices" ]]; then
  echo "══════════════════════════════════════════════"
  echo " ÉPOQUE : 1890 – Le Château des Horloges "
  echo "══════════════════════════════════════════════"
  echo
  echo "Une pièce sombre... des papiers dispersés... un silence épais."
  echo "Le Le Château semble attendre que tout soit en ordre avant de parler."
  echo
  echo "Les feuilles s’envolent doucement, cherchant un lieu où reposer."
  echo "Peut-être qu’un endroit " indices " dédié à leurs secrets manque encore..."
  echo
  echo "Quand tout sera rangé, relancez ce script."
  echo
  exit 0
fi

# 2) Vérifie que le dossier contient des fichiers
txt_count=$(find "$SCRIPT_DIR/indices" -maxdepth 1 -name "*.txt" | wc -l)
if [[ $txt_count -eq 0 ]]; then
  echo "⚠️  Le manoir est silencieux..."
  echo "Les souvenirs n’ont pas encore été rassemblés."
  echo
  echo "Quand tout sera prêt, relancez ce script."
  echo
  exit 1
fi

# 3) Initialisation du temps réel
duration=$((10 * 60))   # 10 minutes
start_time=$(date +%s)

TIME_FILE="$SCRIPT_DIR/time"
PID_FILE="$SCRIPT_DIR/.timer.pid"

: > "$TIME_FILE"  # crée/efface le fichier de temps

update_time_file() {
  while : ; do
    now=$(date +%s)
    rem=$(( duration - (now - start_time) ))
    if (( rem <= 0 )); then
      printf "00:00\n" > "$TIME_FILE"
      echo -e "\n💥 Le temps s'est écoulé... Le Château vous emprisonne à jamais.\n"
      break
    fi
    m=$(( rem/60 ))
    s=$(( rem%60 ))
    printf "%02d:%02d\n" "$m" "$s" > "$TIME_FILE"
    sleep 1
  done
}

# Si un ancien timer tourne encore, on le coupe
if [[ -f "$PID_FILE" ]]; then
  oldpid="$(cat "$PID_FILE" 2>/dev/null)"
  if [[ -n "$oldpid" ]] && kill -0 "$oldpid" 2>/dev/null; then
    kill "$oldpid" 2>/dev/null
    sleep 0.2
  fi
  rm -f "$PID_FILE"
fi

# Lance le timer en arrière-plan, enregistre son PID
update_time_file & echo $! > "$PID_FILE"
disown $(cat "$PID_FILE") 2>/dev/null

# 4) Introduction du jeu
clear
echo "══════════════════════════════════════════════"
echo " ÉPOQUE : 1890 – Le Château des Horloges "
echo "══════════════════════════════════════════════"
echo
echo "Le calme revient dans le château..."
echo "Les papiers sont rangés, la poussière se dépose lentement."
echo "Un souffle discret fait vibrer les engrenages de l’horloge."
echo
echo "Tout semble prêt. Le château vous observe."
echo
echo "⏳ Le temps s’écoule désormais..."
echo "Vous pouvez vérifier le sablier avec :  cat time"
echo
echo "──────────────────────────────────────────────"
echo "Bonne chance."
echo "──────────────────────────────────────────────"
echo
