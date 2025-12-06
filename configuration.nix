# This Is The Main Config Where Everything Else Is Linked To, So Beware #

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/maintenance.nix
      ./modules/systemd.nix
      ./modules/autostart.nix
      ./modules/system.nix
      ./modules/virtualisation.nix
      ./modules/firewall.nix
      ./modules/locale.nix
      ./modules/nvidia.nix
      ./modules/users.nix
      ./modules/fonts.nix
      ./modules/packages.nix
      ./modules/bash.nix
      ./modules/scripts.nix
      ./modules/git.nix
      ./modules/ssh.nix
      ./modules/emacs.nix
      ./modules/cosmic.nix
      ./modules/sway.nix
      ./modules/bluetooth.nix
    ];

  system.stateVersion = "25.05"; # Did you read the comment?

}
