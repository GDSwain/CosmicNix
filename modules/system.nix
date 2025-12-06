{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
   # XCURSOR_SIZE = "20";
  };
}
