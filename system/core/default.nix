{
  config,
  pkgs,
  inputs,
  userSettings,
  systemSettings,
  ...
}: {
  imports = [
    ./audio.nix
    ./locale.nix
    ./nix.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = systemSettings.hostname;

  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  services.printing.enable = true;
  services.flatpak.enable = true;
  programs.dconf.enable = true;

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = ["networkmanager" "wheel" "gamemode" "audio" "video" "libvirtd" "plugdev"];
    packages = with pkgs; [];
  };
}
