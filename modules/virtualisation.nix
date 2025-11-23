{ config, pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;  # use the KVM-enabled QEMU
      runAsRoot = true;         # simpler for now; can be hardened later

      swtpm.enable = true;      # software TPM (for Win11 etc.)

      ovmf = {                  # UEFI firmware for VMs
        enable = true;
        packages = [
          (pkgs.OVMFFull.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };

  # KVM for your ThinkPad P53 (Intel)
  boot.kernelModules = [ "kvm-intel" ];

  # Optional but nice:
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}

