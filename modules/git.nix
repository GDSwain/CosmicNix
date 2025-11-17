{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.git;  # optional, but explicit is nice

    # This writes to /etc/gitconfig (system-wide)
    config = {
      user = {
        name = "GDSwain";
        email = "guy@houseofswain.com";
      };

      init.defaultBranch = "main";
      pull.rebase = true;

      color = {
        ui = "auto";  # string is safer than plain true here
      };
    };
  };
}
