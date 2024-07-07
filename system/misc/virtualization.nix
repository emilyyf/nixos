{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libvirt
    qemu
    virt-manager
  ];
}
