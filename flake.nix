{
  description = "Basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/master";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
	let
		system = "x86_64-linux";
	  pkgs = nixpkgs.legacyPackages.${system};
	in {
    nixosConfigurations = {
      achird = nixpkgs.lib.nixosSystem {
				inherit system;
        modules = [ ./configuration.nix ];
      };
    };
		homeConfigurations = {
      emily = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
        modules = [ ./home.nix ];
      };
		};
  };
}
