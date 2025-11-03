#!/bin/bash
# Vérification finale – Module FUTUR

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

code="$1"
PING_FILE="$SCRIPT_DIR/.ping_ok"

echo
echo "🔍 Vérification finale du flux temporel..."
sleep 1

# 1) Vérifie que le ping a bien fonctionné
if [[ ! -f "$PING_FILE" ]]; then
  echo "❌ Flux inactif. Aucun signal n’a été détecté."
  echo "Le relais de synchronisation n’a pas répondu."
  echo
  echo "Indice : essaie peut-être d’établir un contact réseau..."
  echo
  exit 1
fi

# 2) Vérifie le code entré
if [[ -z "$code" ]]; then
  echo "⚠️  Utilisation : ./verification_futur.sh <code>"
  exit 1
fi

if [[ "$code" == "FX-2048" || "$code" == "fx-2048" ]]; then
  echo
  echo "PING flux_temporel (quantum.network): paquet temporel envoyé"
  sleep 1
  echo "Réponse : 42 ms – Synchronisation en cours..."
  sleep 1
  echo "Réponse : 41 ms – Flux détecté"
  sleep 1
  echo "✅ Le flux temporel répond enfin à ton appel."
  sleep 1
  echo "🔒 Code accepté – Réseau temporel stabilisé."
  echo "Le futur se remet lentement en marche..."
  echo "✨ FIN DU CYCLE — LE FUTUR EST SAUVÉ"
  echo "“Mais le passé se souvient de toi…”"
  echo "──────────────────────────────────────────────"
  echo
  rm -f "$PING_FILE"
  exit 0
else
  echo
  echo "❌ Code incorrect. Le flux rejette la séquence."
  echo "Le futur demeure figé dans le silence..."
  echo
  exit 1
fi
