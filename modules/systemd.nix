{ config, pkgs, ... }:

{
  systemd.user.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';
}
