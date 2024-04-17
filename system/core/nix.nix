{
  config,
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes recursive-nix
      keep-outputs = true
      warn-dirty = false
      keep-derivations = true
      min-free = ${toString (100 * 1024 * 1024)}
      max-free = ${toString (1024 * 1024 * 1024)}
    '';
    settings = {
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      max-jobs = "auto";
      extra-experimental-features = ["flakes" "nix-command" "recursive-nix" "ca-derivations"];
    };
  };

  system.stateVersion = "23.11"; # DO NOT CHANGE
}
