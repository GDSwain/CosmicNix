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

    # ==================== #
    #   Dev / Code Tools   #
    # ==================== #
    
    git
    qemu
    emacs

    # ==================== #
    #   GUI Applications   #
    # ==================== #

    firefox
    protonmail-desktop
    spotify
    libreoffice

    # ==================== #
    # Fonts (System-Wide)  #
    # ==================== #

    jetbrains-mono
    fira-code

  ];
}
