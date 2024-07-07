{config, ...}: {
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
  };

  programs.xwayland.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = true;
    powerManagement.finegrained = false;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
