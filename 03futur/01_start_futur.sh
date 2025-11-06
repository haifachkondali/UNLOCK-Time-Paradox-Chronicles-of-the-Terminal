#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 3 : Le Futur – L’Ordinateur Quantique
# Version Linux stable — by Haifa & ChatGPT 🧠

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

# ───────────────────────────────
# 1️⃣ Préparation automatique de l’archive (si absente)
# ───────────────────────────────
if [[ ! -f "$SCRIPT_DIR/07_data_archive.tar.gz" ]]; then
  echo "📦 Restauration du paquet de données d'urgence..."
  echo "Complément du code final : PX-4098" > "$SCRIPT_DIR/quantum_key.txt"
  echo "Séquence de redémarrage vérifiée." > "$SCRIPT_DIR/secure_sequence.txt"
  tar -czf "$SCRIPT_DIR/07_data_archive.tar.gz" -C "$SCRIPT_DIR" quantum_key.txt secure_sequence.txt
  rm -f "$SCRIPT_DIR/quantum_key.txt" "$SCRIPT_DIR/secure_sequence.txt"
fi

# ───────────────────────────────
# 2️⃣ Introduction immersive
# ───────────────────────────────
clear
echo "══════════════════════════════════════════════"
echo " ÉPOQUE : Le Futur – L’Ordinateur Quantique "
echo "══════════════════════════════════════════════"
echo
echo "Le terminal s’illumine dans un éclat bleu..."
echo "Une voix synthétique résonne dans le vide :"
echo
echo "⚠️  « Un processus parasite a pris le contrôle du temps."
echo "    Trouve-le. Détruis-le. Restaure le flux. »"
echo
sleep 3

# ───────────────────────────────
# 3️⃣ Lancer le processus parasite
# ───────────────────────────────
nohup bash "$SCRIPT_DIR/.07_quantum_core.sh" >/dev/null 2>&1 &
sleep 0.2

echo "💀 Processus 'quantum_core' lancé en tâche de fond."
sleep 1

# ───────────────────────────────
# 4️⃣ Initialiser le timer
# ───────────────────────────────
DURATION=$((10 * 60))
START_TS=$(date +%s)
: > "$SCRIPT_DIR/time"

(
  while : ; do
    now=$(date +%s)
    rem=$(( DURATION - (now - START_TS) ))
    if (( rem <= 0 )); then
      echo "00:00" > "$SCRIPT_DIR/time"
      break
    fi
    m=$(( rem/60 ))
    s=$(( rem%60 ))
    printf "%02d:%02d\n" "$m" "$s" > "$SCRIPT_DIR/time"
    sleep 1
  done
) &

# ───────────────────────────────
# 5️⃣ Attente d’un ping manuel du joueur
# ───────────────────────────────
(
  echo
  echo "⏳ Le système attend un signal réseau..."
  echo
  while : ; do
    if grep -q "bytes from" "$SCRIPT_DIR/03_network_status.txt" 2>/dev/null; then
      echo "ok" > "$SCRIPT_DIR/.ping_ok"
      echo "🌐 Signal détecté : le flux temporel répond à ton appel."
      break
    fi
    sleep 3
  done
) &

# ───────────────────────────────
# 6️⃣ Interface de jeu
# ───────────────────────────────
echo
echo "💡 Commandes utiles :"
echo "  ls, cat, grep, ps aux, kill, vi, tar, diff, ping, cat time"
echo
echo "──────────────────────────────────────────────"
echo "Objectif : Corrige le protocole et restaure les données quantiques."
echo "──────────────────────────────────────────────"
echo

