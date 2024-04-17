{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./1password.nix
    ./games.nix
    ./razer.nix
    ./virtualization.nix
  ];
}
