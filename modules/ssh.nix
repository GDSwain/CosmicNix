{ config, pkgs, ... }:

{
  # SSH client configuration (writes /etc/ssh/ssh_config)
  environment.etc."ssh/ssh_config".text = ''
    Host github.com
      User git
      IdentityFile ~/.ssh/id_ed25519_github

    Host work-server
      HostName 192.168.1.10
      User oggy_user
      Port 2222
  '';

  # SSH server (optional — only if you want sshd running)
  services.openssh = {
    enable = false;  # set to true if you ever want sshd
  };

  # SSH agent (OpenSSH one, no GNOME/gcr)
  programs.ssh = {
    # ❗ DO NOT set `enable` here; that option doesn't exist in NixOS.
    startAgent = true;
    # agentTimeout = "1h";  # optional
  };
  services.gnome.gcr-ssh-agent.enable = false;
}

