#!/bin/bash
# Remet le jeu à zéro
echo "🔄 Réinitialisation du module..."
pkill -f start_passe.sh 2>/dev/null
sleep 1
cd ..
exec ./start_passe.sh

