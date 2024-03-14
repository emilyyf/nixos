{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
		rofi
		dmenu
		st
		feh
		gnome.gnome-keyring
	];

	services.gnome.gnome-keyring.enable = true;

	xdg.portal.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	# xdg.portal.configPackages = [ "xdg-desktop-portal-gtk" ];
	xdg.portal.config = {
		common = {
			default = [ "gtk" ];
		};
	};
	services.xserver.displayManager.lightdm.enable = true;

	services.xserver.windowManager.dwm = {
		enable = true;
		package = 
			pkgs.dwm.overrideAttrs {
				src = pkgs.fetchgit {
					url = /home/emily/Stuff/dwm;
					rev = "6e2079cbae9f0c6eddb8bc8641ac8c3172d62d88";
					hash = "sha256-MkDUa+diu4BSdLpUyZ2tFxv9X+wOKN99U4YT6qqcFR8=";
				};
			};
	};
}
