{ config, pkgs, ... }:

{
  users.users.oggy = {
    isNormalUser = true;
    description = "Oggy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
