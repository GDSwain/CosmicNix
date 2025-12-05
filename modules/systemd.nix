{ config, pkgs, ... }:

{
  systemd.settings.Manager = {
    DefaultTimeoutStartSec = "30s";
    DefaultTimeoutStopSec  = "15s";
  };
}

