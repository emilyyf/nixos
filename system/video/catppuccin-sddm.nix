{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "Catppuccin macchiato";

  src = pkgs.fetchurl {
    url = "https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-macchiato.zip";
    sha256 = "1yh4f9xdm81bp8qy2yl5nw35haicfczks958zqr5c68kzr6h6hsa";
  };

  buildInputs = [
    pkgs.libsForQt5.qt5.qtsvg
    pkgs.libsForQt5.qt5.qtquickcontrols2
  ];

  dontUnpack = true;
  dontWrapQtApps = true;

  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src
    cp -R ./catppuccin-macchiato/* $out
    sed -i 's/QtVersion=6/QtVersion=5/' $out/metadata.desktop
  '';
}
