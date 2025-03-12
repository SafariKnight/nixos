{
  console.earlySetup = false;
  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    initrd.systemd.enable = true;
    initrd.kernelModules = [ "amdgpu" ];
    plymouth = {
      enable = true;
      extraConfig = ''
        PlymouthTimeout=0
      '';
    };
    kernelParams = [
      "boot.shell_on_fail"
      "i915.fastboot=1"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "quiet"
    ];
  };
}
