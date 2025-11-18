{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "sync-all"
      (builtins.readFile ../scripts/sync-all.sh))
  ];
}
