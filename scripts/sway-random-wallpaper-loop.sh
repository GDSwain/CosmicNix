#!/usr/bin/env bash

SCRIPT="/etc/nixos/scripts/sway-random-wallpaper.sh"

while true; do
  "$SCRIPT"
  sleep 600  # 600 seconds = 10 minutes
done

