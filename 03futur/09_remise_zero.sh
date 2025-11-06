#!/bin/bash
# 09_remise_zero.sh — Réinitialisation complète du module FUTUR
# by Haifa & ChatGPT

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

echo "🔄 Réinitialisation du module Futur..."
sleep 1

PID_FILE="$SCRIPT_DIR/.quantum_core.pid"
TIME_FILE="$SCRIPT_DIR/time"
PING_FILE="$SCRIPT_DIR/.ping_ok"
BACKUP_DIR="$SCRIPT_DIR/backup"
REBOOT_FILE="$SCRIPT_DIR/06_reboot_protocol.sh"
ARCHIVE_FILE="$SCRIPT_DIR/07_data_archive.tar.gz"

# ───────────────────────────────
# 1️⃣ Stoppe le processus parasite s'il reste
# ───────────────────────────────
if [[ -f "$PID_FILE" ]]; then
  pid=$(cat "$PID_FILE")
  if [[ -n "$pid" ]]; then
    kill "$pid" 2>/dev/null
  fi
  rm -f "$PID_FILE"
fi

# ───────────────────────────────
# 2️⃣ Réinitialise les fichiers de statut
# ───────────────────────────────
rm -f "$PING_FILE"
echo "10:00" > "$TIME_FILE"

# ───────────────────────────────
# 3️⃣ Supprime le dossier backup et ses fichiers extraits
# ───────────────────────────────
if [[ -d "$BACKUP_DIR" ]]; then
  echo "🧹 Suppression du dossier 'backup' et de ses données..."
  rm -rf "$BACKUP_DIR"
fi

# ───────────────────────────────
# 4️⃣ Restaure le fichier reboot_protocol.sh dans son état d'origine
# ───────────────────────────────
if [[ -f "$REBOOT_FILE" ]]; then
  echo "♻️  Restauration du protocole de redémarrage..."
  cat > "$REBOOT_FILE" <<'EOF'
#!/bin/bash
# reboot_protocol.sh 

echo "🧠 Initialisation du cœur quantique..."
sleep 1
# echo "🔓 Protocole de redémarrage activé."
sleep 1
echo "⚠️  Erreur : ligne critique désactivée."
sleep 1
echo "Pour réparer le protocole, éditez ce script."
EOF
  chmod +x "$REBOOT_FILE"
fi

# ───────────────────────────────
# 5️⃣ Restaure aussi l’archive si elle a été supprimée
# ───────────────────────────────
if [[ ! -f "$ARCHIVE_FILE" ]]; then
  echo "📦 Restauration de l’archive manquante..."
  echo "Complément du code final : PX-4098" > "$SCRIPT_DIR/quantum_key.txt"
  echo "Séquence de redémarrage vérifiée." > "$SCRIPT_DIR/secure_sequence.txt"
  tar -czf "$ARCHIVE_FILE" -C "$SCRIPT_DIR" quantum_key.txt secure_sequence.txt
  rm -f "$SCRIPT_DIR/quantum_key.txt" "$SCRIPT_DIR/secure_sequence.txt"
fi

# ───────────────────────────────
# 6️⃣ Relance le Quantum Core pour un nouveau cycle
# ───────────────────────────────
nohup bash "$SCRIPT_DIR/.07_quantum_core.sh" >/dev/null 2>&1 &
sleep 0.5
echo "⚙️  Quantum Core relancé pour un nouveau cycle."

# ───────────────────────────────
# 7️⃣ Message immersif
# ───────────────────────────────
echo
echo "🧘 Le flux du futur est effacé. Tout est silencieux à nouveau."
echo "Le protocole est réinitialisé et les données ont été purgées."
echo "Relance le cycle avec : ./01_start_futur.sh"
echo


