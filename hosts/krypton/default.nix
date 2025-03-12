{ modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  qt = {
    enable = true;
    style = "kvantum";
  };

  users.users.kareem = {
    extraGroups = [
      "networkmanager"
      "input"
      "uinput"
      "kvm"
      "libvirt"
    ];
  };
}
