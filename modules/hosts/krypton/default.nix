{config, ...}: {
  configurations.nixos.krypton = {pkgs, ...}: {
    imports = [
      config.flake.modules.nixos."user/kareem"
    ];

    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "25.05";

    networking = {
      hostName = "krypton";
      hostId = "f9bd4f45";
      interfaces.wlp12s0f3u1.name = "wlan0";
    };

    environment.systemPackages = with pkgs; [
      git
      wget
      ddcutil
    ];

    boot.initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usb_storage"
      "usbhid"
      "sd_mod"
    ];

    hardware.i2c.enable = true;

    services.power-profiles-daemon.enable = false;
  };

  configurations.nixos.krypton-impure.module = {
    imports = [
      config.configurations.nixos.krypton.module
      {impurity.enable = true;}
    ];
  };
}
