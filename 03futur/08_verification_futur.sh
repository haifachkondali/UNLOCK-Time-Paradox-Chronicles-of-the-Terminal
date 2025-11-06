#!/bin/bash
# Vérification finale du module FUTUR

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PID_FILE="$SCRIPT_DIR/.quantum_core.pid"
PING_FILE="$SCRIPT_DIR/.ping_ok"
BACKUP_DIR="$SCRIPT_DIR/backup"
CODE_EXPECTED="PX-4098"

echo
echo "🔍 Analyse finale du flux quantique..."
sleep 1

# 1️⃣ Vérifie si le processus parasite est toujours actif
if [[ -f "$PID_FILE" ]]; then
  pid=$(cat "$PID_FILE")
  if kill -0 "$pid" 2>/dev/null; then
    echo "⚠️  Le processus 'quantum_core' est toujours actif."
    echo "Tuez-le avec : kill \$(cat .quantum_core.pid)"
    echo
    exit 1
  fi
fi

# 2️⃣ Vérifie si le ping a réussi
if [[ ! -f "$PING_FILE" ]]; then
  echo "🌐 Aucune réponse du flux temporel détectée."
  echo "Essayez un vrai ping : ping *.*.*.*"
  echo
  exit 1
fi

# 3️⃣ Vérifie que le joueur a extrait les données dans backup/
if [[ ! -d "$BACKUP_DIR" ]]; then
  echo "📦 Données non restaurées."
  echo "Indice : crée un dossier 'backup' puis extrait l’archive avec :"
  echo "  tar "
  echo
  exit 1
fi

if [[ ! -f "$BACKUP_DIR/quantum_key.txt" || ! -f "$BACKUP_DIR/secure_sequence.txt" ]]; then
  echo "⚠️  Fichiers manquants dans le dossier backup."
  echo "Vérifie que l’extraction s’est bien passée :"
  echo "  ls backup/"
  echo
  exit 1
fi

# 4️⃣ Vérifie que la ligne critique est réactivée
if ! grep -q "Protocole de redémarrage activé" "$SCRIPT_DIR/06_reboot_protocol.sh" 2>/dev/null; then
  echo "⚠️  Le script de redémarrage n’a pas encore été corrigé."
  echo "Modifiez-le avec : vi 06_reboot_protocol.sh"
  echo
  exit 1
fi

# 5️⃣ Vérifie le code final
if [[ "$1" == "$CODE_EXPECTED" ]]; then
  echo
  echo "✅ Code accepté. Le flux quantique est stabilisé."
  echo "🌐 Connexion restaurée. Le Futur est sauvé."
  echo
  echo "💫 Le temps reprend son cours..."
  echo "──────────────────────────────────────────────"
  echo "✨ FIN DU CYCLE — LE FUTUR EST SAUVÉ"
  echo "“Mais le passé se souvient de toi…”"
  echo "──────────────────────────────────────────────"
  rm -f "$PID_FILE" "$PING_FILE"
  exit 0
else
  echo
  echo "❌ Code incorrect. Essaie encore."
  echo
  exit 1
fi
