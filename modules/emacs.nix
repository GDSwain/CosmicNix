{ config, pkgs, ... }:

{
  services.emacs = {
    enable = true;              # turn on the user emacs daemon
    install = true;             # install the user service
    package = pkgs.emacs;       # use your chosen Emacs build
    startWithGraphical = true;  # start when your graphical session starts
    defaultEditor = true;       # optional: sets EDITOR=emacsclient
  };
}

