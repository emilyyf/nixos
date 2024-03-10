{
  description = "Basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/master";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nix-gaming.url = "github:fufexan/nix-gaming";

		nix-citizen.url = "github:LovingMelody/nix-citizen";
		nix-citizen.inputs.nix-gaming.follows = "nix-gaming";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
	let
		system = "x86_64-linux";
	  pkgs = nixpkgs.legacyPackages.${system};
	in {
    nixosConfigurations = {
      achird = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = {inherit inputs;};
        modules = [ ./configuration.nix ];
      };
    };
		homeConfigurations = {
      emily = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = {inherit inputs;};
        modules = [ ./home.nix ];
      };
		};
  };
}
