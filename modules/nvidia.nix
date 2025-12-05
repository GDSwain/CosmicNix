{ config, pkgs, ... }:

{
  # OpenGL / GPU stack
  hardware.graphics.enable = true;

  # NVIDIA-specific config
  #hardware.nvidia = {
  #  modesetting.enable = true;
  #  powerManagement.enable = false;
  #  powerManagement.finegrained = false;
  #  open = false;    # Turing (T1000) is usually better with proprietary driver
  #  nvidiaSettings = true;
  #  package = config.boot.kernelPackages.nvidiaPackages.stable;
  #};

  # X/Wayland video drivers
  # services.xserver.videoDrivers = [ "nvidia" ];

  # Optional: if you ever want PRIME offload explicitly
  # hardware.nvidia.prime = {
  #   offload.enable = true;
  #   intelBusId = "PCI:0:2:0";
  #   nvidiaBusId = "PCI:1:0:0";
  # };
  services.xserver.videoDrivers = [ "modsetting" ];
}
