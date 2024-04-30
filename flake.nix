{
  description = "Basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-gaming.url = "github:fufexan/nix-gaming";

    nix-citizen.url = "github:LovingMelody/nix-citizen";
    nix-citizen.inputs.nix-gaming.follows = "nix-gaming";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    agenix,
    nixvim,
    nix-darwin,
    ...
  } @ inputs: let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "achird";
      timezone = "America/Sao_Paulo";
      locale = "en_US.UTF-8";
    };

    userSettings = {
      username = "emily";
      githubUser = "emilyyf";
      name = "Emily";
      email = "emily@anaboth.com";
      editor = "nvim";
    };

    lib = nixpkgs.lib;
    system = systemSettings.system;
    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true;};
    };
  in {
    nixosConfigurations = {
      achird = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [
          ./hosts/achird
          agenix.nixosModules.default
        ];
      };
      code1 = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [
          ./hosts/code1
        ];
      };
    };
    homeConfigurations = {
      emily = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [
          ./users/emily/home.nix
          agenix.homeManagerModules.default
          inputs.nixvim.homeManagerModules.nixvim
        ];
      };
    };
    darwinConfigurations = {
      Vela = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit inputs;
          inherit self;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [
          ./hosts/vela
        ];
      };
    };
  };
}
