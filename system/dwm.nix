{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
		rofi
		dmenu
		st
	];

	services.xserver.windowManager.dwm = {
		enable = true;
		package = 
			pkgs.dwm.overrideAttrs {
				src = /home/emily/Stuff/dwm;
			};
	};
}
