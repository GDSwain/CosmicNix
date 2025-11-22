#!/usr/bin/env bash
set -euo pipefail

SSD_LABEL="BackupSSD"
SSD_MOUNT="/run/media/$USER/$SSD_LABEL"

SCREENSHOT_SRC="$HOME/Pictures"
SCREENSHOT_DST="$HOME/Pictures/Screenshots"

GIT_REPOS=(
  "/etc/nixos"
  "$HOME/.doom.d"
)

log() {
  printf '[%s] %s\n' "$(date -Iseconds)" "$*"
}

sync_git_repo() {
  local repo="$1"
  if [ ! -d "$repo/.git" ]; then
    log "Skipping $repo (not a git repo)"
    return
  fi

  log "Syncing git repo: $repo"
  cd "$repo"

  if [ -z "$(git status --porcelain)" ]; then
    log "  No changes to commit."
    return
  fi

  git add -A
  git commit -m "Auto backup: $(date -Iseconds)" || {
    log "  Nothing to commit (maybe only untracked ignored files)."
  }

  if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
    log "  Pushing to remote…"
    git push
  else
    log "  No upstream set for this branch; skipping push."
  fi
}

move_screenshots() {
  mkdir -p "$SCREENSHOT_DST"

  # Do we have any matching screenshots?
  if find "$SCREENSHOT_SRC" -maxdepth 1 -type f -name 'Screenshot_*.png' -print -quit | grep -q .; then
    log "Moving screenshots from $SCREENSHOT_SRC to $SCREENSHOT_DST"

    find "$SCREENSHOT_SRC" -maxdepth 1 -type f -name 'Screenshot_*.png' \
      -print -exec mv {} "$SCREENSHOT_DST"/ \;
  else
    log "No screenshots to move."
  fi
}

backup_home_to_ssd() {
  # Try to make sure the SSD is mounted at SSD_MOUNT.
  if ! mountpoint -q "$SSD_MOUNT"; then
    log "Backup SSD not mounted at $SSD_MOUNT. Checking for device…"

    if [ ! -b "/dev/disk/by-label/$SSD_LABEL" ]; then
      log "Portable SSD with label '$SSD_LABEL' not found – skipping backup."
      return
    fi

    log "Found device /dev/disk/by-label/$SSD_LABEL – attempting to mount via udisksctl…"
    if udisksctl mount -b "/dev/disk/by-label/$SSD_LABEL" >/dev/null 2>&1; then
      log "Mounted $SSD_LABEL."
    else
      log "Failed to mount $SSD_LABEL – skipping backup."
      return
    fi
  else
    log "Backup SSD already mounted at $SSD_MOUNT."
  fi

  # At this point, the drive should be mounted.
  if ! mountpoint -q "$SSD_MOUNT"; then
    log "Backup SSD still not mounted at $SSD_MOUNT – skipping backup."
    return
  fi

  SSD_BACKUP_DIR="$SSD_MOUNT/CosmicNix"
  mkdir -p "$SSD_BACKUP_DIR"

  log "Backing up home data to $SSD_BACKUP_DIR"

  rsync -avh --delete \
    --exclude '.cache' \
    --exclude 'Downloads' \
    --exclude '.config/Proton Mail' \
    --exclude '.config/BraveSoftware' \
    "$HOME/Documents" \
    "$HOME/Projects" \
    "$HOME/.config" \
    "$SSD_BACKUP_DIR"

  # Optional: unmount when done so the backup stays "offline"
  log "Unmounting backup SSD…"
  udisksctl unmount -b "/dev/disk/by-label/$SSD_LABEL" >/dev/null 2>&1 || \
    log "Warning: failed to unmount $SSD_LABEL (it may be busy)."
}

log "Starting sync-all"

for repo in "${GIT_REPOS[@]}"; do
  sync_git_repo "$repo"
done

move_screenshots

backup_home_to_ssd

log "sync-all completed."

