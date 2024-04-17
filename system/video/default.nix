{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./dwm.nix
    ./video.nix
  ];
}
