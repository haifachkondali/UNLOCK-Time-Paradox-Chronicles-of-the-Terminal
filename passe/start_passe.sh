#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger
# Version jouable dans le vrai terminal Bash (tabulation activée)

# ───────────────────────────────
# 1. Préparation automatique
# ───────────────────────────────
find . -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null
chmod -R +x ./indices 2>/dev/null

# ───────────────────────────────
# 2. Introduction du jeu
# ───────────────────────────────
clear
echo "══════════════════════════════════════════════"
echo " ÉPOQUE : 1890 – Le manoir de l’horloger "
echo "══════════════════════════════════════════════"
echo
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
echo
sleep 2

# ───────────────────────────────
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

