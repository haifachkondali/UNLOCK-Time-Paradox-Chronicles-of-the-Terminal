#!/bin/bash
# UNLOCK: Time Paradox – Chapitre 1 : Le manoir de l’horloger
# Script de remise à zéro complet du module "Passé"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

TIME_FILE="$SCRIPT_DIR/time"
PID_FILE="$SCRIPT_DIR/.timer.pid"
HORLOGE_FILE="$SCRIPT_DIR/02_horloge.txt"

echo "🔄 Réinitialisation du module en cours..."
sleep 1

# 1) Couper le timer en cours s'il tourne
if [[ -f "$PID_FILE" ]]; then
  pid="$(cat "$PID_FILE" 2>/dev/null)"
  if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then
    kill "$pid" 2>/dev/null
    sleep 0.2
  fi
  rm -f "$PID_FILE"
fi

# 2) Réinitialiser le temps (valeur affichée au prochain lancement)
echo "10:00" > "$TIME_FILE"

# 3) Restaurer le contenu original de l’horloge
if [[ -f "$HORLOGE_FILE" ]]; then
  echo "🕰️  Restauration du cadran d’origine..."
  sleep 1
  cat > "$HORLOGE_FILE" <<'EOF'
══════════════════════════════════════════════
              HORLOGE DU CHATEAU
══════════════════════════════════════════════

L’aiguille oscille, indécise, entre deux instants.
Les engrenages semblent tourner… à rebours.

Une inscription gravée sur le cadran attire ton regard :
« L’heure du salut se trouve dans son reflet. »

──────────────────────────────────────────────
Indice : Le temps ne s’écoule pas toujours dans un seul sens.
Peut-être qu’une heure *miroir* détient la clé du passage.

Format attendu : HH:MM
──────────────────────────────────────────────
EOF
  echo "✅ Horloge réinitialisée."
else
  echo "⚠️  Fichier d’horloge manquant, rien à restaurer."
fi

# 4) Nettoyage des indices (si existait)
if [[ -d "$SCRIPT_DIR/indices" ]]; then
  echo "🧹 Le chateau efface toute trace du précédent voyage..."
  sleep 1
  mv "$SCRIPT_DIR"/indices/*.txt "$SCRIPT_DIR"/ 2>/dev/null
  rm -rf "$SCRIPT_DIR/indices"
  sleep 1
else
  echo "⚠️  Aucun souvenir à effacer... Le château semble déjà vide."
  sleep 1
fi

echo
echo "⏳ Le sablier se renverse..."
sleep 1
echo "Le temps recommence à s’écouler, et le château retrouve son calme."
echo
echo "Vous pouvez relancer le jeu avec :"
echo "  ./01_start_passe.sh"
echo
