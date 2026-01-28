{
  configurations.nixos.krypton = {pkgs, ...}: {
    services.udev.extraRules = ''
      # Switch RTL8821CU from storage/CD-ROM mode to Wi-Fi mode
      ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", \
        RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 0bda -p 1a2b -P c811 -KW"
    '';
  };
}
