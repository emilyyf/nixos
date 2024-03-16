{ config, pkgs, inputs, ... }:

{
	programs.starship = {
		enable = true;
		enableZshIntegration = true;
		settings = {};
	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		enableAutosuggestions = true;
		syntaxHighlighting.enable = true;
		defaultKeymap = "viins";

		shellAliases = {
			md="mkdir -p";
			v="nvim";
			vi="nvim";
			vim="nvim";
			javar="java -jar";
			ping=" ping -c 5";
			"cd.."="cd ..";
			shr="source ~/.zshrc";
			she="vim ~/.zshrc";
			ls="ls --color=auto";
			":3"="echo";
			gch="git checkout";
			gchn="git checkout -b";
			gc="git commit";
			gpm="git commit -pm";
			ga="git add";
			gaa="git add .";
			gs="git status";
			gi="git init .";
			gps="git push";
			gpl="git pull";
			gd="git diff";
			yolo="git commit -m \"$(curl -s whatthecommit.com/index.txt)\"";
			bye="shutdown now";
			fkbye="halt";
			cya="reboot";
			please="sudo";
			dn="date +\"%Y%m%d %H%M %Z\"";
			aoeu="setxkbmap us";
			asdf="setxkbmap us dvorak";
		};

		initExtra = ''
			mkcd() {
				mkdir -p "$@" && cd "$_"
			}
		'';
	};
}
