{
  lib,
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
  pkgs,
}:
buildGoModule rec {
  pname = "goroot";
  version = "main";

  src = fetchFromGitHub {
    owner = "emilyyf";
    repo = "goroot";
    rev = "${version}";
    hash = "sha256-tZ/yxMBl1cqbhp0gtno9fC1A5ryQDoSaDoO+7Abrdwc=";
  };

  vendorHash = null;

  buildInputs = with pkgs.buildPackages; [
    xorg.libX11
  ];

  meta = with lib; {
    description = "Simple app to set X root window name";
    homepage = "https://github.com/emilyyf/goroot/";
    license = licenses.bsd3;
  };
}
