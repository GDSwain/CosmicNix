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
    swaymsg exec proton-mail

    # Messages on workspace 2 (left) – fill these when you know the clients
    # swaymsg workspace 2
    # swaymsg exec <messages-client>

    # WhatsApp on workspace 2 (left)
    # swaymsg workspace 2
    # swaymsg exec <whatsapp-client>

    # Spotify on workspace 3 (left)
    swaymsg workspace 3
    swaymsg exec spotify

    # Browser on workspace 4 (middle)
    swaymsg workspace 4
    swaymsg exec brave

    # Proton VPN on workspace 5 (middle)
    swaymsg workspace 5
    swaymsg exec protonvpn-app
    
    # Emacs on workspace 7 (right)
    swaymsg workspace 7
    swaymsg exec emacs-pgtk

  '';
in {
  environment.systemPackages = [ startSession ];
}

