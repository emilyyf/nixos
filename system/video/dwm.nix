{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (callPackage ./goroot.nix {})
    feh
    gnome.gnome-keyring
    gcr
    dunst
    picom
    kitty
    (st.overrideAttrs (oa: {
      src = fetchgit {
        url = "https://github.com/emilyyf/st";
        rev = "a2d595bdbdb8a7adc60daee5ee5c2e0d77661cb8";
        hash = "sha256-M+fHpXOCcpXMT/lgpMBYSmENmvFtMll6VrAW8KIxCts=";
      };
      buildInputs = oa.buildInputs ++ [harfbuzz];
    }))
    (dmenu.overrideAttrs (oa: {
      src = fetchgit {
        url = "https://github.com/emilyyf/dmenu";
        rev = "4fdd436db9c7604034e590afbda154bafea8a177";
        hash = "sha256-xl1IRrc2D9XW41uLA7KPDPjKCIc+8GU21zkfevyNoRo=";
      };
    }))
  ];

  services = {
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
    tumbler.enable = true;
    dbus.packages = [pkgs.gcr];

    displayManager.sddm = {
      enable = true;
      theme = "${import ./catppuccin-sddm.nix {inherit pkgs;}}";
    };

    xserver.windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = pkgs.fetchgit {
          url = "https://github.com/emilyyf/dwm";
          rev = "7b641c7514fe7f6af244c1e8a56ca05978ef25d7";
          hash = "sha256-yg+9DN7kno3ha71ySqCIwgXFBRE82BJpb6num9VDBlQ=";
        };
      };
    };
  };

  programs = {
    thunar.enable = true;
    xfconf.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];

    config = {
      common = {
        default = ["gtk"];
      };
    };
  };
}
