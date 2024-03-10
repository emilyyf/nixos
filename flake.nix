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
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = import nixpkgs {
			inherit system;
			config = { allowUnfree = true; };
		};
	in {
    nixosConfigurations = {
      achird = lib.nixosSystem {
				inherit system;
				specialArgs = {inherit inputs;};
        modules = [ ./system/configuration.nix ];
      };
    };
		homeConfigurations = {
      emily = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = {inherit inputs;};
        modules = [ ./users/emily/home.nix ];
      };
		};
  };
}
