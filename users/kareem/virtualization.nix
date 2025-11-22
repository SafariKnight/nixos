{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    docker-init
    distrobox
  ];
  virtualisation.docker = {
    enable = false;
    extraOptions = "--iptables=False";
    rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        dns = [
          "1.1.1.1"
          "1.0.0.1"
        ];
      };
    };
  };

  networking.firewall.trustedInterfaces = [
    "incusbr0"
    "virbr0"
  ];
  virtualisation = {
    incus.enable = true;
    podman.enable = true;
    libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [virtiofsd];
    };
  };
  programs.virt-manager.enable = true;
  networking.nftables.enable = true;
}
