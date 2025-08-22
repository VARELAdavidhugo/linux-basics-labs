#!/usr/bin/env bash
set -euo pipefail

SRC="${1:-$HOME/Documents}"
DEST="${2:-$HOME/Backups}"
RETENTION_DAYS="${RETENTION_DAYS:-7}"
IGNORE_FILE="${IGNORE_FILE:-$SRC/.backupignore}"
DRY_RUN="${DRY_RUN:-false}"
LOG_FILE="${LOG_FILE:-}"

log(){ local m="[$(date +'%F %T')] $*"; echo "$m"; [[ -n "$LOG_FILE" ]] && echo "$m" >> "$LOG_FILE"; }
fail(){ log "ERREUR: $*"; exit 1; }

[[ -d "$SRC" ]] || fail "Source inexistante: $SRC"
mkdir -p "$DEST"

AVAIL_KB=$(df --output=avail "$DEST" | tail -1)
[[ "$AVAIL_KB" -gt 51200 ]] || fail "Espace disque insuffisant dans $DEST"

STAMP="$(date +'%Y-%m-%d_%H-%M-%S')"
ARCHIVE="$DEST/sauvegarde_${STAMP}.tar.gz"

TAR_OPTS=()
[[ -f "$IGNORE_FILE" ]] && TAR_OPTS+=(--exclude-from="$IGNORE_FILE")

log "Sauvegarde de: $SRC"
log "Destination  : $ARCHIVE"
[[ -f "$IGNORE_FILE" ]] && log "Exclusions   : $IGNORE_FILE"
[[ -n "$LOG_FILE" ]] && log "Log fichier  : $LOG_FILE"
[[ "$DRY_RUN" == "true" ]] && log "(mode simulation, aucune écriture)"

if [[ "$DRY_RUN" == "true" ]]; then
  tar -czvf /dev/null "${TAR_OPTS[@]}" -C "$(dirname "$SRC")" "$(basename "$SRC")" | head -n 10
else
  tar -czvf "$ARCHIVE" "${TAR_OPTS[@]}" -C "$(dirname "$SRC")" "$(basename "$SRC")"
fi

if [[ "$DRY_RUN" != "true" ]]; then
  tar -tzf "$ARCHIVE" > /dev/null || fail "Archive corrompue: $ARCHIVE"
  log "Archive OK: $ARCHIVE"
  find "$DEST" -type f -name 'sauvegarde_*.tar.gz' -mtime +"$RETENTION_DAYS" -print -delete | sed 's/^/[SUPPRESSION] /' || true
  log "Rétention appliquée (> $RETENTION_DAYS jours)."
fi

log "Terminé."
