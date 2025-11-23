{ config, pkgs, ... }:

{
  users.users.oggy = {
    isNormalUser = true;
    description = "Oggy";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" ];
    packages = with pkgs; [];
  };
}
