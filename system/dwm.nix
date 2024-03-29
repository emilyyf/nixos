{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    feh
    gnome.gnome-keyring
    gcr
    dunst
    picom
    (st.overrideAttrs (oa: {
      src = fetchgit {
        url = https://github.com/emilyyf/st;
        rev = "933453f2f0040e6a758ebc74d265b0d63e418f50";
        hash = "sha256-vELFYuZtUXcdkyfB5ZpqJm66sevnJI9pzQMVQajczdM=";
      };
    }))
    (dmenu.overrideAttrs (oa: {
      src = fetchgit {
        url = https://github.com/emilyyf/dmenu;
        rev = "85673fd42e8d6db07b0d611157974e61d78826d0";
        hash = "sha256-3lRLa3NIg+7bUSDnef/rVL3XwvWWHTIPQ8mcVaq/SVI=";
      };
    }))
  ];

  services.gnome.gnome-keyring.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

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
        url = https://github.com/emilyyf/dwm;
        rev = "70ba291722f03b173c6ca18efa60369b2bceb215";
        hash = "sha256-WounfHUjH+kmuFKSr5/9xgUiyL2tgUQQISjVn7cFTkw=";
      };
    };
  };
}
