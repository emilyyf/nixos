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
        rev = "aa3545d8d4b471d2725b0a9aa5f8a24ac21c0154";
        hash = "sha256-JXYOsfwT7ykDVxlZQ0/0c3UHe+CmPQ82ClvcC9SugM8=";
      };
      buildInputs = oa.buildInputs ++ [harfbuzz];
    }))
    (dmenu.overrideAttrs (oa: {
      src = fetchgit {
        url = https://github.com/emilyyf/dmenu;
        rev = "dba37a1f4808f71112a550afaa3cad7081c0bca0";
        hash = "sha256-Rx30pMQfk+6mD/f6dfxw7U9WHCHv1mAmOSBSYKo3G/0=";
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
        rev = "45a45319afbff101c1a2ee49fcdc4c3b0f924c77";
        hash = "sha256-0Kh6uY1RFXJuXFg5xv2ktuWT5uq6iQow9rQNdNs09qU=";
      };
    };
  };
}
