{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./cli
    ./core
    ./misc
    ./video
  ];
}
