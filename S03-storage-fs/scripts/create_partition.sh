#!/usr/bin/env bash
set -euo pipefail
DISK="${1:-/dev/sdb}"
PART="${DISK}1"

[[ -b "$DISK" ]] || { echo "[ERREUR] Disque introuvable: $DISK"; exit 1; }
lsblk -no TYPE "$DISK" | grep -q disk || { echo "[ERREUR] $DISK n'est pas un disque."; exit 1; }

echo "[INFO] Cible: $DISK"
lsblk "$DISK" || true
read -p "⚠️ Tape OUI pour PARTITIONNER + FORMATER $DISK > " ok
[[ "${ok:-}" == "OUI" ]] || { echo "[ABORT] Annulé."; exit 1; }

echo "[STEP] Création d'une partition unique (sfdisk)"
sudo sfdisk --quiet "$DISK" <<EOF2
label: dos
, , 83
EOF2

echo "[STEP] Relecture de la table"
sudo partprobe "$DISK" 2>/dev/null || true
sleep 1

echo "[STEP] Formatage EXT4 sur $PART"
sudo mkfs.ext4 -F "$PART"

echo "[OK] Partition prête: $PART"
lsblk "$DISK"
