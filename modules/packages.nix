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
    qemu_kvm
    virt-manager
    emacs-pgtk
    mesa-demos
    lsd

    # ==================== #
    #   GUI Applications   #
    # ==================== #

    firefox
    brave
    protonmail-desktop
    protonvpn-gui
    spotify
    libreoffice
    zeroad

    # ==================== #
    #  Display Management  #
    # ==================== #

    wdisplays
    cosmic-randr

    # ==================== #
    #   Unnecessary Shit   #
    # ==================== #

    cmatrix

  ];
}
