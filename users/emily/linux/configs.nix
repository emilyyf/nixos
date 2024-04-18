{
  config,
  pkgs,
  inputs,
  age,
  ...
}: {
  targets.genericLinux.enable = true;
  xdg.enable = true;
  home.stateVersion = "23.11"; # DO NOT CHANGE

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  xsession.profileExtra = ''
    eval $(${pkgs.gnome.gnome-keyring}/bin/gnome-keyring-daemon --daemonize --components=ssh,secrets)
    export SSH_AUTH_SOCK
  '';
}
