{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify-player
  ];
  home.file.".config/spotify-player/app.toml".source = ../../../.secrets/spotify-player;
}
