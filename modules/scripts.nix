{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "sync-all" ''
      #!${pkgs.bash}/bin/bash
      set -euo pipefail

      ###############
      # SETTINGS
      ###############

      # Where your portable SSD is mounted
      SSD_MOUNT="/run/media/guy/BackupSSD"
      SSD_BACKUP_DIR="$SSD_MOUNT/CosmicNix"

      # Git repos to sync (adjust these!)
      GIT_REPOS=(
        "/etc/nixos"
        "$HOME/.doom.d"
      )

      ###############
      # FUNCTIONS
      ###############

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

      backup_home_to_ssd() {
        if [ ! -d "$SSD_MOUNT" ]; then
          log "Portable SSD not found at $SSD_MOUNT – skipping backup."
          return
        fi

        mkdir -p "$SSD_BACKUP_DIR"

        log "Backing up home data to $SSD_BACKUP_DIR"

        rsync -avh --delete \
          --exclude '.cache' \
          --exclude 'Downloads' \
          "$HOME/Documents" \
          "$HOME/Projects" \
          "$HOME/.config" \
          "$SSD_BACKUP_DIR"
      }

      ###############
      # MAIN
      ###############

      log "Starting sync-all"

      for repo in "''${GIT_REPOS[@]}"; do
        sync_git_repo "$repo"
      done

      backup_home_to_ssd

      log "sync-all completed."
    '')
  ];
}

