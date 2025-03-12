{
  inputs,
  pkgs,
  ...
}:
{
  environment.variables = {
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };
  # environment.systemPackages = [
  #   inputs.winapps.packages."${pkgs.system}".winapps
  #   inputs.winapps.packages."${pkgs.system}".winapps-launcher
  #   pkgs.virtiofsd
  # ];
  services.qemuGuest.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.package = pkgs.qemu_kvm;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  # virtualisation.libvirtd.qemu.verbatimConfig = ''
  #   cgroup_device_acl = [
  #           "/dev/null", "/dev/full", "/dev/zero",
  #           "/dev/random", "/dev/urandom",
  #           "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
  #           "/dev/rtc","/dev/hpet",
  #           "/dev/input/by-id/usb-04d9_USB_Gaming_Mouse-event-mouse"
  #   ]
  # '';
  virtualisation.spiceUSBRedirection.enable = true;
  users.groups.libvirtd.members = [ "kareem" ];
}
