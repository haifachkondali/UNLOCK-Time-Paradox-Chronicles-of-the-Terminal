#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 2 : Le Laboratoire Éteint
# Auteur : Haifa Chkoundali
# Version : Présent (difficulté moyenne+, code = PX-(jour × mois))

# ───────────────────────────────
# Paramètres de partie (temps réel)
# ───────────────────────────────
TIME_MIN=10                       # minutes réelles
START_TS=$(date +%s)
SOLVED=0

# ───────────────────────────────
# Introduction
# ───────────────────────────────
intro() {
  clear
  echo "══════════════════════════════════════════════"
  echo " ÉPOQUE : Le Présent – Le Laboratoire Éteint "
  echo "══════════════════════════════════════════════"
  echo
  echo "Les serveurs sont figés. Un terminal attend vos commandes."
  echo "Un voyant rouge clignote : le flux temporel est désynchronisé."
  echo
  echo "> Tapez 'help' pour la liste des commandes."
  echo
}

# ───────────────────────────────
# Aide & temps
# ───────────────────────────────
help_menu() {
  echo
  echo "Commandes disponibles :"
  echo "  inspect room            → observer la salle"
  echo "  ls                      → lister les fichiers"
  echo "  cat <fichier>           → lire un fichier "
  echo "  grep <mot> <fichier>    → chercher un mot dans un fichier"
  echo "  useradd <nom>           → créer un utilisateur autorisé"
  echo "  tar -xvzf <archive>     → extraire une archive"
  echo "  solve <code>            → entrer la séquence de réactivation"
  echo "  remise zero             → relancer le module"
  echo "  cat time                → afficher le temps restant (réel)"
  echo "  quit                    → quitter"
  echo
}

show_time() {
  local now=$(date +%s)
  local elapsed_sec=$(( now - START_TS ))
  local remaining=$(( TIME_MIN*60 - elapsed_sec ))
  if (( remaining < 0 )); then remaining=0; fi
  local m=$(( remaining/60 ))
  local s=$(( remaining%60 ))
  printf "\n⏳ Temps restant : %02d:%02d (réel)\n\n" "$m" "$s"
}

# ───────────────────────────────
# Décor & fichiers
# ───────────────────────────────
inspect_cmd() {
  if [[ "$1" == "room" ]]; then
    echo
    echo "Vous observez la salle : rangées de serveurs, écrans en veille."
    echo "Sur un moniteur, une ligne : « Diagnostic disponible dans system.log »."
    echo
  else
    echo -e "\nRien de particulier ici...\n"
  fi
}

ls_cmd() {
  echo
  echo "system.log  users.conf  technician_note.txt  data_backup.tar.gz  terminal_status.txt  secure_data.txt"
  echo
}

# ───────────────────────────────
# Opérations utilitaires
# ───────────────────────────────
time_guard() {
  local now=$(date +%s)
  local elapsed_min=$(( (now - START_TS) / 60 ))
  if (( elapsed_min >= TIME_MIN )); then
    echo
    echo "💥 Le temps est écoulé... le Présent s’effondre dans une boucle."
    echo "Utilisez 'remise zero' pour recommencer."
    echo
    exit 1
  fi
}

# ───────────────────────────────
# Démarrage
# ───────────────────────────────
intro

# ───────────────────────────────
# Boucle principale
# ───────────────────────────────
while (( SOLVED == 0 )); do
  time_guard
  read -p "> " CMD A1 A2 A3

  case "$CMD" in
    help)
      help_menu
      ;;

    inspect)
      inspect_cmd "$A1"
      ;;

    ls)
      ls_cmd
      ;;

    cat)
      if [[ "$A1" == "time" ]]; then
        show_time
      elif [[ -n "$A1" && -f "$A1" ]]; then
        echo; cat "$A1"; echo
      else
        echo -e "\nFichier introuvable.\n"
      fi
      ;;

    grep)
      if [[ -n "$A1" && -n "$A2" && -f "$A2" ]]; then
        echo
        grep -i --color=never "$A1" "$A2" || echo "Aucune correspondance."
        echo
      else
        echo "Utilisation : grep <mot> <fichier>"
      fi
      ;;

    useradd)
      if [[ "$A1" == "technicien" ]]; then
        echo -e "\n✅ Utilisateur 'technicien' ajouté. Accès mis à jour.\n"
      else
        echo -e "\n❌ Utilisateur non reconnu. (Indice : technicien)\n"
      fi
      ;;

    tar)
      # Simulation d'extraction contrôlée
      if [[ "$A1" == "-xvzf" && "$A2" == "data_backup.tar.gz" ]]; then
        echo
        echo "x secure_data.txt"
        echo
        # (secure_data.txt existe déjà, on simule juste la sortie)
      else
        echo -e "\nSyntaxe : tar -xvzf data_backup.tar.gz\n"
      fi
      ;;

    solve)
      # Code attendu = PX-(jour × mois), sans indices explicites.
      d=$(date +%d)
      m=$(date +%m)
      val=$((10#$d * 10#$m))
      expected="PX-$val"
      if [[ "$A1" == "$expected" ]]; then
        echo
        echo "✅ Code accepté."
        echo "Synchronisation sur la date du système : $(date '+%d/%m/%Y')."
        echo "Les serveurs reprennent… le flux du Présent est stabilisé."
        echo "🎉 Le passage vers le Futur s’ouvre."
        echo
        SOLVED=1
      else
        echo -e "\n❌ Code incorrect. Le terminal reste silencieux...\n"
      fi
      ;;

    remise)
      if [[ "$A1" == "zero" ]]; then
        echo -e "\n🔄 Réinitialisation du module...\n"
        exec ./start_present.sh
      else
        echo -e "\nCommande incomplète. Essayez : remise zero\n"
      fi
      ;;

    quit)
      echo -e "\nVous quittez le laboratoire...\n"
      exit 0
      ;;

    *)
      echo -e "\nCommande inconnue. Tapez 'help' pour la liste des commandes.\n"
      ;;
  esac
done

# Épilogue
echo "══════════════════════════════════════════════"
echo "   CHAPITRE 2 TERMINÉ – Le Présent Réactivé  "
echo "══════════════════════════════════════════════"
