{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # ==================== #
    #  System Core Tools   #
    # ==================== #

    wget
    curl

    # ==================== #
    #    Security Tools    #
    # =====================#

    fido2luks
    fido2-manage
    yubikey-manager
    yubikey-personalization
    yubioath-flutter

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
    tealdeer
    cheat

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
