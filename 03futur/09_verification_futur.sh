#!/bin/bash
# Vérification finale du module FUTUR

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PID_FILE="$SCRIPT_DIR/.quantum_core.pid"
PING_FILE="$SCRIPT_DIR/.ping_ok"
ARCHIVE_FILE="$SCRIPT_DIR/08_data_archive.tar.gz"
BACKUP_DIR="$SCRIPT_DIR/backup"
CODE_EXPECTED="PX-4098"

echo
echo "🔍 Analyse finale du flux quantique..."
sleep 1

# 1️⃣ Vérifie si le processus parasite est détruit
if [[ -f "$PID_FILE" ]]; then
  pid=$(cat "$PID_FILE")
  if kill -0 "$pid" 2>/dev/null; then
    echo "⚠️  Le processus 'quantum_core' est toujours actif."
    echo "Indice : utilisez → kill PID "
    echo
    exit 1
  fi
fi

# 2️⃣ Vérifie si le ping manuel a réussi
if [[ ! -f "$PING_FILE" ]]; then
  echo "🌐 Aucun signal réseau détecté."
  echo "Astuce : utilisez → ping *.*.*.* > ___.txt"
  echo
  exit 1
fi

# 3️⃣ Vérifie si l’archive a été extraite
if [[ ! -d "$BACKUP_DIR" ]]; then
  echo "📦 Données non restaurées."
  echo "Astuce : utilisez → mkdir backup && tar -xvzf data_archive.tar.gz -C backup"
  echo
  exit 1
fi

# 4️⃣ Vérifie le protocole de redémarrage
if ! grep -q "Protocole de redémarrage activé" "$SCRIPT_DIR/06_reboot_protocol.sh" 2>/dev/null; then
  echo "⚠️  Le protocole n’a pas été réactivé."
  echo "Astuce : éditez le fichier avec → vi ____.sh"
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
  echo "❌ Code incorrect. Essaie encore."
  echo "Indice : le code se trouve dans l’archive extraite."
  echo
  exit 1
fi

