#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 3 : Le Futur

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1
# ───────────────────────────────
# Préparation automatique de l’archive (si absente)
# ───────────────────────────────
if [[ ! -f "$SCRIPT_DIR/data_archive.tar.gz" ]]; then
  echo "📦 Restauration du paquet de données d'urgence..."
  # Crée les fichiers source (temporairement)
  echo "Complément du code final : PX-4098" > "$SCRIPT_DIR/quantum_key.txt"
  echo "Séquence de redémarrage vérifiée." > "$SCRIPT_DIR/secure_sequence.txt"
  # Crée l’archive
  tar -czf "$SCRIPT_DIR/data_archive.tar.gz" -C "$SCRIPT_DIR" quantum_key.txt secure_sequence.txt
  # Supprime les fichiers temporaires
  rm -f "$SCRIPT_DIR/quantum_key.txt" "$SCRIPT_DIR/secure_sequence.txt"
fi

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
# Timer (affichable via cat time)
# ───────────────────────────────
DURATION=$((10*60))
START_TS=$(date +%s)
: > time
(
  while : ; do
    now=$(date +%s)
    rem=$(( DURATION - (now - START_TS) ))
    if (( rem <= 0 )); then
      echo "00:00" > time
      break
    fi
    m=$(( rem/60 )); s=$(( rem%60 ))
    printf "%02d:%02d\n" "$m" "$s" > time
    sleep 1
  done
) &

# ───────────────────────────────
# Surveillance automatique du ping réussi
# ───────────────────────────────
# Le joueur doit faire un vrai `ping 8.8.8.8`
# Ce bloc vérifie toutes les 5 secondes si le flux répond et marque la réussite.
(
  while : ; do
    if ping -c 1 -W 1 8.8.8.8 &>/dev/null; then
      echo "ok" > .ping_ok
      break
    fi
    sleep 5
  done
) &
echo
echo "💡 Commandes utiles :"
echo "  ls, cat, grep, htop, ps aux, kill, vi, tar, diff, ping, cat time"
echo
echo "──────────────────────────────────────────────"
echo "Objectif : Corrige le protocole et restaure les données quantiques."
echo 