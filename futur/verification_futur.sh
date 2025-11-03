#!/bin/bash
# Vérification finale du module FUTUR

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PID_FILE="$SCRIPT_DIR/.quantum_core.pid"
CODE_EXPECTED="PX-4098"

echo
echo "🔍 Analyse finale du flux quantique..."
sleep 1

# 1) Vérifie si le processus quantum_core tourne encore
if [[ -f "$PID_FILE" ]]; then
  pid=$(cat "$PID_FILE")
  if kill -0 "$pid" 2>/dev/null; then
    echo "⚠️  Le processus 'quantum_core' est encore actif."
    echo "Tuez-le avec : kill $pid"
    echo
    exit 1
  fi
fi

# 2) Vérifie si la ligne critique est décommentée
if ! grep -q "Protocole de redémarrage activé" "$SCRIPT_DIR/reboot_protocol.sh"; then
  echo "⚠️  Le script n’a pas encore été corrigé."
  echo "Modifiez-le avec : vi reboot_protocol.sh"
  echo
  exit 1
fi

# 3) Vérifie la clé finale
if [[ "$1" == "$CODE_EXPECTED" ]]; then
  echo "✅ Code accepté. Le flux quantique est stabilisé."
  echo "🌐 Connexion restaurée. Le Futur est sauvé."
  echo
  echo "💫 Le temps reprend son cours..."
  echo "──────────────────────────────────────────────"
  echo "✨ FIN DU CYCLE — LE FUTUR EST SAUVÉ"
  echo "“Mais le passé se souvient de toi…”"
  echo "──────────────────────────────────────────────"
  rm -f "$PID_FILE"
  exit 0
else
  echo "❌ Code incorrect. Essaie encore."
  echo
  exit 1
fi
