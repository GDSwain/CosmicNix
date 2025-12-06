{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.symbols-only
      jetbrains-mono
      liberation_ttf
      fira-code
      fira-code-symbols
      fira-sans
    ];

    fontconfig.defaultFonts = {
      serif = [ "Liberation ttf" ];
      sansSerif = [ "Noto Sans" ];
      monospace = [ "Fira Code" ];
    };
  };
}

