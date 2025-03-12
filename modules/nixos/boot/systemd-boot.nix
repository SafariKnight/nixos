{ lib, ... }:
{
  boot.loader = {
    timeout = lib.mkForce 0;
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 100;
    };
  };
}
