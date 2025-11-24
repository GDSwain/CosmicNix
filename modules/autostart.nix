# autostart.nix
{ lib, pkgs, ... }:

let
  inherit (lib) getExe;

  # 👉 This is the *only* thing you edit:
  # names must match pkgs.<name> in nixpkgs
  autostartNames = [
    "brave"
    "protonvpn-gui"
    "protonmail-desktop"
   # "emacs-pgtk"
    # add more here
  ];

  mkEntry = name:
    let
      pkg = pkgs.${name};
      exe = getExe pkg;  # figures out the right binary (uses meta.mainProgram etc.)
    in {
      name = "xdg/autostart/${name}.desktop";
      value.text = ''
        [Desktop Entry]
        Type=Application
        Version=1.0
        Name=${name}
        Comment=Autostart ${name} at login
        Exec=${exe}
        Terminal=false
        X-GNOME-Autostart-enabled=true
        OnlyShowIn=COSMIC;
      '';
    };

in {
  environment.etc =
    builtins.listToAttrs (map mkEntry autostartNames);
}

