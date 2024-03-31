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
