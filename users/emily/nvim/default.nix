{...}: {
  imports = [
    ./remap.nix
    ./set.nix
    ./plugins
    ./colorscheme.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
