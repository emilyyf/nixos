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
					rev = "e49ea6a9b62357a899eebb0f0be3c884b2703ab3";
					hash = "sha256-AcdlRLCd+oeewQ3fMcQpM+fQALwetE3NN3b2V2ktmLU=";
				};
			};
	};
}
