#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger
# Version finale épurée et immersive

# ───────────────────────────────
# 1) Permissions automatiques
# ───────────────────────────────
find . -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null
clear

# ───────────────────────────────
# 2) Vérification du dossier indices/
# ───────────────────────────────
if [[ ! -d "indices" ]]; then
  echo "══════════════════════════════════════════════"
  echo " ÉPOQUE : 1890 – Le manoir de l’horloger "
  echo "══════════════════════════════════════════════"
  echo
  echo "Le manoir semble en désordre..."
  echo "Des papiers sont éparpillés un peu partout."
  echo "Vous sentez qu’il faut tout rassembler avant de pouvoir agir."
  echo
  echo "──────────────────────────────────────────────"
  echo "Il vous manque quelque chose..."
  echo
  exit 0
fi

# ───────────────────────────────
# 3) Vérifie que des fichiers existent
# ───────────────────────────────
txt_count=$(find indices -maxdepth 1 -name "*.txt" | wc -l)
if [[ $txt_count -eq 0 ]]; then
  echo "Le silence règne... aucun document ne semble rangé."
  echo "Vous sentez que les indices doivent être regroupés ailleurs."
  exit 1
fi

# ───────────────────────────────
# 4) Initialisation du temps réel
# ───────────────────────────────
duration=$((10 * 60))   # 10 minutes réelles
start_time=$(date +%s)
mkdir -p indices
: > indices/time  # créer le fichier du temps

update_time_file() {
  while : ; do
    now=$(date +%s)
    rem=$(( duration - (now - start_time) ))
    if (( rem <= 0 )); then
      printf "00:00\n" > indices/time
      break
    fi
    m=$(( rem/60 ))
    s=$(( rem%60 ))
    printf "%02d:%02d\n" "$m" "$s" > indices/time
    sleep 1
  done
}
update_time_file & TIMER_PID=$!
trap 'kill "$TIMER_PID" 2>/dev/null' EXIT

# ───────────────────────────────
# 5) Introduction du jeu
=======
# Version jouable dans le vrai terminal Bash (tabulation activée)

# ───────────────────────────────
# 1. Préparation automatique
# ───────────────────────────────
find . -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null
chmod -R +x ./indices 2>/dev/null

# ───────────────────────────────
# 2. Introduction du jeu
>>>>>>> 53515d9ddc3e4d365bdeb00ee3eb4cf3c7e7a254
# ───────────────────────────────
clear
echo "══════════════════════════════════════════════"
echo " ÉPOQUE : 1890 – Le manoir de l’horloger "
echo "══════════════════════════════════════════════"
echo
<<<<<<< HEAD
echo "Vous pénétrez dans le cœur du manoir..."
echo "L’air est froid. Le silence pèse."
echo "Une horloge immobile semble attendre quelque chose."
echo
echo "──────────────────────────────────────────────"
echo "Les indices reposent désormais dans la pièce."
echo "──────────────────────────────────────────────"
=======
echo "Vous venez d'apparaître dans un salon victorien poussiéreux."
echo "Une grande horloge gothique trône au centre de la pièce."
echo "Son tic-tac s'est arrêté..."
echo
echo "💡 Commandes utiles (réelles) :"
echo "   - ls, ls -a : pour explorer"
echo "   - cat <fichier> : pour lire un indice"
echo "   - grep <mot> <fichier> : pour chercher un mot"
echo "   - echo '12:00' > horloge.txt : interagir avec l’horloge"
echo "   - ../verification_passe.sh <code> : pour tenter une solution"
echo "   - ../remise_zero.sh : pour recommencer"
echo
echo "📁 Les fichiers à explorer se trouvent dans le dossier 'indices/'."
>>>>>>> 53515d9ddc3e4d365bdeb00ee3eb4cf3c7e7a254
echo
sleep 2

# ───────────────────────────────
<<<<<<< HEAD
# 6) Passage dans le vrai shell Bash interactif
# ───────────────────────────────
cd indices || exit 1
bash --rcfile <(echo "PS1='🕰️  PASSE> '")

# ───────────────────────────────
# 7) Fin du jeu
# ───────────────────────────────
echo
echo "Le manoir retombe dans le silence..."
=======
# 3. Lancer le minuteur (10 minutes réelles)
# ───────────────────────────────
(
  duration=$((10 * 60))
  start_time=$(date +%s)
  while true; do
    current_time=$(date +%s)
    elapsed=$((current_time - start_time))
    remaining=$((duration - elapsed))
    if (( remaining <= 0 )); then
      echo
      echo "💥 Le temps est écoulé ! Vous êtes piégé dans la boucle temporelle."
      pkill -P $$ bash
      break
    fi
    minutes=$((remaining / 60))
    seconds=$((remaining % 60))
    printf "⏳ Temps restant : %02d:%02d\r" "$minutes" "$seconds"
    sleep 1
  done
) &

# ───────────────────────────────
# 4. Passage dans le vrai shell interactif
# ───────────────────────────────
cd indices || exit 1
echo
echo "🕰️ Vous entrez dans le terminal temporel du manoir..."
echo "────────────────────────────────────────────────────────"
bash --rcfile <(echo "PS1='🕰️  PASSE> '")

# ───────────────────────────────
# 5. Fin du jeu
# ───────────────────────────────
echo
echo "🎩 Vous quittez le manoir..."
pkill -f verification_passe.sh 2>/dev/null
>>>>>>> 53515d9ddc3e4d365bdeb00ee3eb4cf3c7e7a254

