{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # ==================== #
    #  System Core Tools   #
    # ==================== #

    wget
    curl

    # ==================== #
    #   CLI Enhancements   #
    # ==================== #

    eza
    bat
    ripgrep
    fd
    tree
    fzf
    btop
    neovim
    starship
    fastfetch

    # ==================== #
    #   Dev / Code Tools   #
    # ==================== #
    
    git
    qemu
    emacs
    mesa-demos

    # ==================== #
    #   GUI Applications   #
    # ==================== #

    firefox
    protonmail-desktop
    protonvpn-gui
    spotify
    libreoffice

    # ==================== #
    # Fonts (System-Wide)  #
    # ==================== #

    jetbrains-mono
    fira-code

  ];
}
