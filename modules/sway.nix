# /etc/nixos/modules/sway.nix
{ config, pkgs, ... }:

{
  # Turn on Sway itself
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # gtk theming/portals
  };

  # Programs Sway will launch
#  environment.systemPackages = with pkgs; [
#    wezterm          # terminal
#    fuzzel           # launcher
#    xfce.thunar      # file manager
#    grim             # screenshots
#    slurp
#    wl-clipboard     # wl-copy / wl-paste
#    mako             # notifications (optional)
#    swaybg	     # wallpaper manager
#  ];

  # Nice to have for Thunar (mounting, trash, smb, etc.)
  services.gvfs.enable = true;

  # D-Bus is needed for portals
  services.dbus.enable = true;

  # Portals for screen sharing / flatpaks under Wayland
  xdg.portal = {
    enable = true;

    wlr.enable = true;

    extraPortals = with pkgs; [ xdg-desktop-portal-wlr ];
  };
}

