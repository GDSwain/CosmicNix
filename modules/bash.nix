{ config, pkgs, ... }:

{
  programs.bash.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "...l" = "cd ../.. && ${pkgs.eza}/bin/eza -lah";
    "..l" = "cd .. && ${pkgs.eza}/bin/eza -lah";

    cat = "${pkgs.bat}/bin/bat --paging=never";
    ls = "${pkgs.eza}/bin/eza --group-directories-first --icons=auto";
    l = "${pkgs.eza}/bin/eza --color=auto -F";
    la = "${pkgs.eza}/bin/eza -A --color=auto -F";
    ll = "${pkgs.eza}/bin/eza -lh --color=auto -F";
    lsa = "${pkgs.eza}/bin/eza -la --color=auto -F";

    e = "nano";
    nv = "nvim";
    emacs = "emacsclient -c -a ''";

    fcd = "cd \"$(find . -type d 2>/dev/null | ${pkgs.fzf}/bin/fzf)\"";
    fe = "nano \"$(find . -type f 2>/dev/null | ${pkgs.fzf}/bin/fzf)\"";
    fh = "eval \"$(history | ${pkgs.fzf}/bin/fzf | cut -c 8-)\"";

    clr = "clear";
    cls = "clear";
    cp = "cp -i";
    dfh = "df -h";
    duh = "du -h --max-depth=1";
    mv = "mv -i";
    rm = "rm -i";

    please = "sudo";
    rbt = "systemctl reboot";
    sdn = "shutdown now";
    rb = "sudo nixos-rebuild switch";
  };
}
