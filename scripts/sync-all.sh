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
  else
    git add -A
    read -rp "Enter commit message for $repo: " commit_msg
    git commit -m "$commit_msg" || log "  Nothing to commit (maybe only untracked or ignored files)."
  fi

  if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
    log "  Pushing to Codeberg…"
    git push codeberg
  else
    log "  No upstream set for this branch; skipping push."
  fi
}

backup_home_to_ssd() {
  if ! mountpoint -q "$SSD_MOUNT"; then
    log "Backup SSD not mounted at $SSD_MOUNT. Checking for device…"

    if [ ! -b "/dev/disk/by-label/$SSD_LABEL" ]; then
      log "Portable SSD with label '$SSD_LABEL' not found – skipping backup."
      return
    fi

    log "Found device /dev/disk/by-label/$SSD_LABEL – attempting to mount via udisksctl…"
    if udisksctl mount -b "/dev/disk/by-label/$SSD_LABEL" >/dev/null 2>&1; then

