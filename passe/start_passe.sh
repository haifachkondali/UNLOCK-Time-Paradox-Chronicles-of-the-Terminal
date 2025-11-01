#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger
# Version finale – intégrée, interactive et immersive

# ───────────────────────────────
# Préparation automatique
# ───────────────────────────────
chmod +x ./remise_zero.sh 2>/dev/null
chmod +x ./verification_passe.sh 2>/dev/null

# Initialisation du temps réel
duration=$((10 * 60))   # 10 minutes réelles
start_time=$(date +%s)
solved=0

# ───────────────────────────────
# Fonctions
# ───────────────────────────────

afficher_intro() {
  echo "══════════════════════════════════════════════"
  echo " ÉPOQUE : 1890 – Le manoir de l'horloger "
  echo "══════════════════════════════════════════════"
  echo
  echo "Vous venez d'apparaître dans un salon victorien poussiéreux."
  echo "Une grande horloge gothique trône au centre de la pièce."
  echo "Son tic-tac s'est arrêté..."
  echo
  echo "⏳ Vous avez 10 minutes réelles pour sauver le passé."
  echo
  echo "> Tapez 'help' pour obtenir la liste des commandes."
  echo
}

afficher_aide() {
  echo
  echo "Commandes disponibles :"
  echo "  inspect room           → observer la pièce"
  echo "  ls [-a]                → voir les fichiers (avec -a pour voir les fichiers cachés)"
  echo "  cat <fichier>          → lire un document"
  echo "  grep <mot> <fichier>   → rechercher un mot dans un fichier (indice caché)"
  echo "  echo <texte> > fichier → interagir avec un objet (ex: echo 12:00 > horloge.txt)"
  echo "  solve <code>           → tenter une solution"
  echo "  cat time               → afficher le temps restant"
  echo "  remise zero            → remettre le jeu à zéro"
  echo "  quit                   → quitter le jeu"
  echo
}

inspecter() {
  if [[ "$1" == "room" ]]; then
    echo
    echo "Vous observez la pièce :"
    echo "Une horloge, une table avec des papiers, et une odeur de cire froide."
    echo "Sur la table, un sablier semble mesurer le temps..."
    echo
  else
    echo "Rien de particulier ici..."
  fi
}

afficher_ls() {
  if [[ "$1" == "-a" ]]; then
    echo ".mirror_clock.txt  alphabet_secret.txt  boitemusique.txt  horloge.txt  journal.txt  lettre_chiffree.txt  time"
  else
    echo "alphabet_secret.txt  boitemusique.txt  horloge.txt  journal.txt  lettre_chiffree.txt  time"
  fi
  echo
}

# ───────────────────────────────
# Gestion du temps réel
# ───────────────────────────────
cat_time() {
  current_time=$(date +%s)
  elapsed=$((current_time - start_time))
  remaining=$((duration - elapsed))

  if (( remaining <= 0 )); then
    echo
    echo "💥 Le temps s'est écoulé ! Vous êtes piégé dans la boucle temporelle."
    echo "Essayez 'remise zero' pour recommencer."
    echo
    solved=0
  else
    minutes=$((remaining / 60))
    seconds=$((remaining % 60))
    printf "\n⏳ Temps restant : %02d:%02d\n\n" "$minutes" "$seconds"
  fi
}

# ───────────────────────────────
# Commandes UNIX simulées
# ───────────────────────────────

# Recherche d'un mot dans un fichier
grep_file() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Utilisation : grep <mot> <fichier>"
    return
  fi
  if [[ ! -f "$2" ]]; then
    echo "Fichier introuvable."
    return
  fi
  echo
  grep --color=never -i "$1" "$2" || echo "Aucun résultat trouvé."
  echo
}

# Interaction avec un fichier (horloge)
echo_text() {
  if [[ "$1" == "12:00" && "$2" == ">" && "$3" == "horloge.txt" ]]; then
    echo "🕰️ Vous remettez doucement les aiguilles à l'heure..."
    sleep 1
    echo "✅ L'horloge semble vibrer... Essayez maintenant 'solve 12:00'."
  else
    echo "Rien ne se passe..."
  fi
}

# ───────────────────────────────
# Boucle principale du jeu
# ───────────────────────────────

afficher_intro

while [[ $solved -eq 0 ]]; do
  read -p "> " cmd arg1 arg2 arg3

  case "$cmd" in
    help)
      afficher_aide
      ;;
    inspect)
      inspecter "$arg1"
      ;;
    ls)
      afficher_ls "$arg1"
      ;;
    cat)
      if [[ "$arg1" == "time" ]]; then
        cat_time
      elif [[ -f "$arg1" ]]; then
        echo
        cat "$arg1"
        echo
      else
        echo "Fichier introuvable."
      fi
      ;;
    grep)
      grep_file "$arg1" "$arg2"
      ;;
    echo)
      echo_text "$arg1" "$arg2" "$arg3"
      ;;
    solve)
      if [[ -n "$arg1" ]]; then
        ./verification_passe.sh "$arg1"
        if [[ $? -eq 0 ]]; then
          solved=1
        fi
      else
        echo "Utilisation : solve <code>"
      fi
      ;;
    remise)
      if [[ "$arg1" == "zero" ]]; then
        ./remise_zero.sh
        start_time=$(date +%s)
        echo "🔄 Le module a été réinitialisé. Le temps recommence à s’écouler..."
        afficher_intro
      else
        echo "Commande incomplète. Essayez : remise zero"
      fi
      ;;
    quit)
      echo "Vous quittez le manoir..."
      break
      ;;
    *)
      echo "Commande inconnue. Tapez 'help' pour la liste des commandes."
      ;;
  esac
done

if [[ $solved -eq 1 ]]; then
  echo
  echo "🎉 Chapitre 1 réussi ! Le passage vers le Présent s'ouvre..."
fi
