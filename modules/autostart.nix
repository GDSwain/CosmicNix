# /etc/nixos/modules/autostart.nix
{ lib, pkgs, ... }:

let
  startSession = pkgs.writeShellScriptBin "start-session" ''
    #!/usr/bin/env bash
    set -euo pipefail

    # Optional: start your random wallpaper script if it exists
    # Adjust this path if needed
    if [ -x "/etc/nixos/scripts/sway-random-wallpaper-loop.sh" ]; then
      "/etc/nixos/scripts/sway-random-wallpaper-loop.sh" &
    fi

    # Proton Mail on workspace 1 (left)
    swaymsg workspace 1
    sleep 1.0
    swaymsg exec proton-mail
    sleep 1.0

    # Spotify on workspace 3 (left)
    swaymsg workspace 3
    sleep 1.0
    swaymsg exec spotify
    sleep 1.0

    # Browser on workspace 4 (middle)
    swaymsg workspace 4
    sleep 1.0
    swaymsg exec brave
    sleep 1.0

    # Proton VPN on workspace 5 (middle)
    swaymsg workspace 5
    sleep 1.0
    swaymsg exec protonvpn-app
    sleep 1.0
    
  '';
in {
  environment.systemPackages = [ startSession ];
}

