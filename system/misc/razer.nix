{
  config,
  pkgs,
  inputs,
  ...
}: {
  hardware.openrazer.enable = true;
  hardware.openrazer.users = ["emily"];

  environment.systemPackages = with pkgs; [
    polychromatic
  ];
}
