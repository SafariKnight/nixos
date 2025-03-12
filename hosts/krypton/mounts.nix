{ ... }:
{
  boot.tmp.useTmpfs = true;
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/709b455c-06b1-4268-8bec-dc637c272d46";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C029-3856";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  fileSystems."/mnt/hdd" = {
    # label = "HDD";
    device = "/dev/disk/by-uuid/4916caf0-5be2-4187-bdd5-722a13a19fa6";
    fsType = "btrfs";
    options = [
      "subvol=root"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/mnt/important" = {
    # label = "HDD";
    device = "/dev/disk/by-uuid/4916caf0-5be2-4187-bdd5-722a13a19fa6";
    fsType = "btrfs";
    options = [
      "subvol=important"
      "compress=zstd"
      "noatime"
    ];
  };
  services.snapper = {
    persistentTimer = true;
    configs = {
      root = {
        # why does it complain if this isn't named root
        SUBVOLUME = "/mnt/important";
        ALLOW_USERS = [ "kareem" ];
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
      };
    };
  };
  fileSystems."/mnt/dbg" = {
    # label = "HDD";
    device = "/dev/disk/by-uuid/4916caf0-5be2-4187-bdd5-722a13a19fa6";
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "noatime"
    ];
  };

  swapDevices = [ { device = "/dev/disk/by-label/Swap"; } ];
}
