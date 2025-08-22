#!/usr/bin/env bash
set -euo pipefail
ARCHIVE="${1:-}"; TARGET_DIR="${2:-}"
if [[ -z "$ARCHIVE" || -z "$TARGET_DIR" ]]; then
  echo "Usage: $0 /chemin/vers/archive.tar.gz /chemin/cible"; exit 1; fi
[[ -f "$ARCHIVE" ]] || { echo "Archive introuvable: $ARCHIVE"; exit 1; }
mkdir -p "$TARGET_DIR"
echo "[*] Restauration de $ARCHIVE vers $TARGET_DIR"
tar -xzvf "$ARCHIVE" -C "$TARGET_DIR"
echo "[OK] Restauration terminée."
