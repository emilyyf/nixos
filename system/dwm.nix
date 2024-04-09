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
        rev = "a2d595bdbdb8a7adc60daee5ee5c2e0d77661cb8";
        hash = "sha256-M+fHpXOCcpXMT/lgpMBYSmENmvFtMll6VrAW8KIxCts=";
      };
      buildInputs = oa.buildInputs ++ [harfbuzz];
    }))
    (dmenu.overrideAttrs (oa: {
      src = fetchgit {
        url = https://github.com/emilyyf/dmenu;
        rev = "4fdd436db9c7604034e590afbda154bafea8a177";
        hash = "sha256-xl1IRrc2D9XW41uLA7KPDPjKCIc+8GU21zkfevyNoRo=";
      };
    }))
  ];

  services.gnome.gnome-keyring.enable = true;

  services.dbus.packages = [pkgs.gcr];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  xdg.portal.config = {
    common = {
      default = ["gtk"];
    };
  };

  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "${import ./catppuccin-sddm.nix {inherit pkgs;}}";
  };

  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs {
      src = pkgs.fetchgit {
        url = https://github.com/emilyyf/dwm;
        rev = "a5dc708a40e8e6d09548ea12b8bc4042715992cf";
        hash = "sha256-bBzdC6yGgrbnD25pu9vfOBFvmzaT6XtknI1FuNHB1FE=";
      };
    };
  };
}
