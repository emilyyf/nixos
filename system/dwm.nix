{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
		rofi
		dmenu
		st
		feh
	];

	services.xserver.windowManager.dwm = {
		enable = true;
		package = 
			pkgs.dwm.overrideAttrs {
				src = pkgs.fetchgit {
					url = /home/emily/Stuff/dwm;
					rev = "a371440a73084d74b2d8a985b0b16fe804d239d2";
					hash = "sha256-Z9Wj1rX5CNZkEYi1/ttUQSmQS01NYQgjs7mcfrxQB4o=";
				};
			};
	};
}
