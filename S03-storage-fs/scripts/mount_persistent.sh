#!/usr/bin/env bash
set -euo pipefail
PART="${1:-/dev/sdb1}"
MOUNTPOINT="${2:-/mnt/data}"
FS="ext4"

[[ -b "$PART" ]] || { echo "[ERREUR] Partition introuvable: $PART"; exit 1; }

echo "[STEP] Création du point de montage: $MOUNTPOINT"
sudo mkdir -p "$MOUNTPOINT"

if ! mount | grep -q " on $MOUNTPOINT "; then
  echo "[STEP] Montage temporaire"
  sudo mount "$PART" "$MOUNTPOINT"
fi

UUID=$(blkid -s UUID -o value "$PART" || true)
ENTRY=${UUID:+UUID=$UUID}
if [[ -n "$ENTRY" ]]; then
  ENTRY="$ENTRY  $MOUNTPOINT  $FS  defaults  0  2"
else
  ENTRY="$PART  $MOUNTPOINT  $FS  defaults  0  2"
fi

echo "[STEP] Sauvegarde /etc/fstab -> /etc/fstab.bak (si pas déjà)"
sudo cp -n /etc/fstab /etc/fstab.bak || true

if grep -qE "[[:space:]]$MOUNTPOINT[[:space:]]" /etc/fstab; then
  echo "[WARN] Une entrée existe déjà pour $MOUNTPOINT (aucune modif)."
else
  echo "$ENTRY" | sudo tee -a /etc/fstab >/dev/null
  echo "[OK] Entrée ajoutée:"
  echo "     $ENTRY"
fi

echo "[STEP] Test mount -a"
sudo mount -a

echo "[CHECK] df -h | grep $MOUNTPOINT"
df -h | grep "$MOUNTPOINT" || { echo "[ERREUR] Montage non visible."; exit 1; }
echo "[DONE] Montage persistant OK → $MOUNTPOINT"
