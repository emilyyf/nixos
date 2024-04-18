{
  config,
  pkgs,
  inputs,
  age,
  ...
}: {
  imports = [
    ./configs.nix
    ./packages.nix
  ];
}
