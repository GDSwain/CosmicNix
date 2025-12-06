{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # ==================== #
    #  System Core Tools   #
    # ==================== #

    wget
    curl
    bibata-cursors
    adwaita-icon-theme

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
    xfce.mousepad

    # ==================== #
    #   GUI Applications   #
    # ==================== #

    blueman
    brave
    protonmail-desktop
    protonvpn-gui
    spotify
    libreoffice
    zeroad
    eww
    pavucontrol

    # ==================== #
    #  Display Management  #
    # ==================== #

    wdisplays
    cosmic-randr

    # ==================== #
    #   Unnecessary Shit   #
    # ==================== #

    cmatrix

    # ==================== #
    #        Sway          #
    # ==================== #

    fuzzel
    xfce.thunar
    wezterm
    grim
    slurp
    wl-clipboard
    mako
    swaybg
    swayidle
    swaylock
    waybar

  ];
}
