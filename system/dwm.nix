{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rofi
    dmenu
    st
    feh
    gnome.gnome-keyring
    gcr
    dunst
    picom
  ];

  services.gnome.gnome-keyring.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  # xdg.portal.configPackages = [ "xdg-desktop-portal-gtk" ];
  xdg.portal.config = {
    common = {
      default = ["gtk"];
    };
  };
  services.xserver.displayManager.sddm.enable = true;

  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs {
      src = pkgs.fetchgit {
        url = /home/emily/Stuff/dwm;
        rev = "70ba291722f03b173c6ca18efa60369b2bceb215";
        hash = "sha256-WounfHUjH+kmuFKSr5/9xgUiyL2tgUQQISjVn7cFTkw=";
      };
    };
  };
}
