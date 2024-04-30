{...}: {
  imports = [
    <nixos-wsl/modules>
    ../../system/cli
  ];

  wsl.enable = true;

  system.stateVersion = "23.11";
}
