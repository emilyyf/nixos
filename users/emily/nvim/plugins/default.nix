{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./editor.nix
    ./coding.nix
  ];
}
