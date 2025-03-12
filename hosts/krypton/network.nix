{ lib, pkgs, ... }:
{
  networking = {
    hostName = "krypton";
    useDHCP = lib.mkDefault true;
    networkmanager = {
      enable = true;
      wifi.powersave = false;
      dispatcherScripts = [
        {
          type = "basic";
          source = pkgs.writeShellScript "ResetConnection" ''
            if [[ "$2" == "down" ]] then
              ${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 0bda -p c811 -R
            fi
          '';
        }
      ];
    };
    interfaces.wlp9s0f4u1 = {
      # mtu = 1478;
      name = "wlan0";
    };
  };
}
