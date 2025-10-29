#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger
# Version avec affichage du temps réel

solved=0         # 0 = pas résolu, 1 = énigme résolue

# Durée réelle du niveau (en secondes)
duration=$((10 * 60))   # 10 minutes réelles 
start_time=$(date +%s) # Heure réelle du lancement

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
  echo "> Tapez 'help' pour obtenir la liste des commandes."
  echo
}

afficher_aide() {
  echo
  echo "Commandes disponibles :"
  echo "  inspect room       → observer la pièce"
  echo "  ls [-a]            → voir les fichiers (avec -a pour voir les fichiers cachés)"
  echo "  cat <fichier>      → lire un document ou un fichier virtuel (ex: cat time)"
  echo "  solve <code>       → tenter une solution (vérifiée dans un module externe)"
  echo "  remise zero        → remettre le jeu à zéro"
  echo "  quit               → quitter le jeu"
  echo
}

inspecter() {
  if [[ "$1" == "room" ]]; then
    echo
    echo "Vous observez la pièce :"
    echo "Une horloge, une table avec des papiers et une odeur de cire froide."
    echo "Sur la table, un fichier mystérieux nommé 'time' semble surveiller les secondes..."
    echo
  else
    echo
    echo "Rien de particulier ici..."
    echo
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
# Fonction temps réel
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
# Boucle principale du jeu
# ───────────────────────────────

afficher_intro

while [[ $solved -eq 0 ]]; do
  read -p "> " cmd arg1 arg2

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
        echo
        echo "Fichier introuvable."
        echo
      fi
      ;;

    solve)
      if [[ -n "$arg1" ]]; then
        ./verification_passe.sh "$arg1"
        if [[ $? -eq 0 ]]; then
          solved=1
        fi
      else
        echo
        echo "Utilisation : solve <code>"
        echo
      fi
      ;;

    remise)
      if [[ "$arg1" == "zero" ]]; then
        echo
        ./remise_zero.sh
        echo
        echo "🔄 Le module a été réinitialisé. Vous sentez le temps recommencer à s’écouler..."
        solved=0
        start_time=$(date +%s)
        sleep 1
        afficher_intro
      else
        echo
        echo "Commande incomplète. Essayez : remise zero"
        echo
      fi
      ;;

    quit)
      echo
      echo "Vous quittez le manoir..."
      break
      ;;

    *)
      echo
      echo "Commande inconnue. Tapez 'help' pour la liste des commandes."
      echo
      ;;
  esac
done

# ───────────────────────────────
# Fin de partie
# ───────────────────────────────

if [[ $solved -eq 1 ]]; then
  echo "🎉 Chapitre 1 réussi ! Le passage vers le Présent s'ouvre..."
fi

