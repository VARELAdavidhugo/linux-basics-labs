#!/usr/bin/env bash
set -euo pipefail
MOUNTPOINT="${1:-/mnt/data}"

echo "[TEST] Montage présent ?"
mount | grep -q " on $MOUNTPOINT " && echo "[OK] $MOUNTPOINT monté" || { echo "[FAIL] pas monté"; exit 1; }

echo "[TEST] I/O (écriture/lecture)"
sudo bash -c "echo 'hello storage' > '$MOUNTPOINT/.probe'"
grep -q 'hello storage' "$MOUNTPOINT/.probe" && echo "[OK] Lecture OK" || { echo "[FAIL] Lecture KO"; exit 1; }

echo "[TEST] Espace disque"
df -h "$MOUNTPOINT" || true

echo "[RESULT] Tous les tests OK ✅"
