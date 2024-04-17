{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libvirt
    qemu
    virt-manager
  ];
}
