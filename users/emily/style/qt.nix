{
  config,
  pkgs,
  inputs,
  age,
  ...
}: {
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "Catppuccin-Macchiato";
      package = pkgs.catppuccin-kde.override {
        accents = ["pink"];
        flavour = ["macchiato"];
      };
    };
  };
}
