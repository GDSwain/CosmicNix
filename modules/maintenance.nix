# modules/maintenance.nix
{ config, lib, pkgs, ... }:

{
  #### Nix GC automation
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 14d";
  };

  #### Limit boot entries
  boot.loader.systemd-boot.configurationLimit = 10;

  #### Journald size limits
  services.journald.extraConfig = ''
    SystemMaxUse=500M
    RuntimeMaxUse=100M
  '';

  #### /tmp cleanup on boot
  boot.tmp.cleanOnBoot = true;

  #### Coredumps
  systemd.coredump.enable = false;
}
