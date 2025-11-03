#!/bin/bash
# Remise à zéro du module FUTUR

echo "🔄 Réinitialisation du réseau quantique..."
sleep 1

rm -f .ping_ok time
echo "10:00" > time

echo "🧹 Les signaux ont été effacés."
echo "Vous pouvez relancer le module avec : ./start_futur.sh"
