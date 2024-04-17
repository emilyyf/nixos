{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./audio.nix
    ./locale.nix
    ./nix.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "achird";

  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  services.printing.enable = true;
  services.flatpak.enable = true;
  programs.dconf.enable = true;

  users.users.emily = {
    isNormalUser = true;
    description = "Emily";
    extraGroups = ["networkmanager" "wheel" "gamemode" "audio" "video" "libvirtd" "plugdev"];
    packages = with pkgs; [];
  };

  fileSystems."/run/media/emily/Games" = {
    device = "/dev/disk/by-label/Games";
    fsType = "ext4";
    options = ["nofail"];
  };
}
