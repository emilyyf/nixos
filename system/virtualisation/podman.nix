{...}: {
  virtualisation.podman = {
    enable = true;
  };

  virtualisation.containers.cdi.dynamic.nvidia.enable = true;
}
