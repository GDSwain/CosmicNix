{ config, pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;  # use the KVM-enabled QEMU
      runAsRoot = true;         # simpler for now; can be hardened later

      swtpm.enable = true;      # software TPM (for Win11 etc.)
      # NOTE: libvirtd.qemu.ovmf has been removed in newer NixOS.
      # OVMF/UEFI firmwares from QEMU are now available by default,
      # so we don't configure them here anymore.
    };
  };

  # KVM for your ThinkPad P53 (Intel)
  boot.kernelModules = [ "kvm-intel" ];

  # Optional but nice:
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}

