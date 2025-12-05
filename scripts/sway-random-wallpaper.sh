#!/usr/bin/env bash
set -euo pipefail

DIR="$HOME/Pictures/Wallpaper"

# Collect images (add formats you actually use)
mapfile -t FILES < <(find "$DIR" -type f \
  \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' -o -iname '*.jxl' \))

# Bail if none
[[ ${#FILES[@]} -eq 0 ]] && exit 0

# Pick one at random
W="${FILES[RANDOM % ${#FILES[@]}]}"

# Ask sway to set it (this replaces any prior wallpaper)
swaymsg "output * bg \"$W\" fill" >/dev/null

