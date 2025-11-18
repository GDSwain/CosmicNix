# This Is The Main Config Where Everything Else Is Linked To

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/systemd.nix
      ./modules/system.nix
      ./modules/locale.nix
      ./modules/nvidia.nix
      ./modules/users.nix
      ./modules/packages.nix
      ./modules/bash.nix
      ./modules/scripts.nix
      ./modules/git.nix
      ./modules/ssh.nix
      ./modules/emacs.nix
      ./modules/cosmic.nix
    ];

  system.stateVersion = "25.05"; # Did you read the comment?

}
