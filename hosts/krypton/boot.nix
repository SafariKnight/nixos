{ pkgs, config, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    supportedFilesystems = [ "ntfs" ];
    # extraModprobeConfig = ''
    #   options iwlmvm  power_scheme=1
    #   options iwlwifi power_save=0
    #   options usbcore use_both_schemes=y
    # '';
    kernelModules = [
      "v4l2loopback"
      "usbcore"
      "uas"
      "kvm-amd"
      "usb_storage"
    ];
    initrd = {
      # kernelModules = [ "kvm-amd" ];
      kernelModules = [ ];
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usbhid"
        "uas"
        "usbcore"
        "usb_storage"
        "sd_mod"
      ];
    };
  };
}
