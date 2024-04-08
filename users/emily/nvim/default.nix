{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./remap.nix
    ./set.nix
    ./plugins
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
