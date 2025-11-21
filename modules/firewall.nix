{ config, lib, pkgs, ... }:

{
  networking.firewall = {
    enable = true;             # default on NixOS, but let’s be explicit
    allowPing = false;         # optional: drop ICMP echo-requests from WAN

    # Incoming ports allowed globally (none by default for a laptop):
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];

    # Optional: log dropped packets (noisy if you’re on sketchy networks)
    logRefusedConnections = false;
    logRefusedPackets = false;
  };
}
