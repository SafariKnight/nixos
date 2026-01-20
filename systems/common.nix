# A lot of this was "borrowed" from pluiedev
{
  lib,
  inputs,
  modulesPath,
  config,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  nix = {
    registry.n.to = {
      type = "path";
      path = config.nixpkgs.flake.source;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      max-substitution-jobs = 128;
      trusted-users = ["@wheel"];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "qtwebengine-5.15.19"
      ];
    };
    flake.setNixPath = true;
    overlays = [
      inputs.self.overlays.default
    ];
  };

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth.enable = true;

    initrd = {
      verbose = false;
      systemd.enable = true;

      kernelModules = [
        "amdgpu"
      ];
    };
    kernelParams = [
      "splash"
      "quiet"
      "plymouth.use-simpledrm=0"
      "loglevel=3"
      "nowatchdog"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "system.show_status=auto"
      "rd.udev.log_level=3"
      "vt.global_cursor_default=0"
    ];
    kernel.sysctl = {
      "kernel.prink" = "3 3 3 3";
    };

    tmp.useTmpfs = true;
  };

  # Make Nix use /var/tmp for building, so that
  # large files don't have to live in tmpfs
  systemd.services.nix-daemon.environment.TMPDIR = "/var/tmp";

  # Use native Wayland when possible
  environment.variables = {
    # This *should* be enough for most Electron apps
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    # Apply Nixpkgs-specific flags too
    NIXOS_OZONE_WL = "1";

    # Some SDL 2 apps are very naughty and don't work nicely under Wayland
    SDL_VIDEODRIVER = "x11";

    # SDL 3 should be able to use native Wayland just fine.
    SDL_VIDEO_DRIVER = "wayland";
  };

  services = {
    dbus.implementation = "broker";
    udisks2.enable = true;

    tlp.enable = true;

    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      jack.enable = true;
    };

    # resolved = {
    #   enable = true;
    #   dnssec = "true";
    #   domains = ["~."];
    #   fallbackDns = [
    #     "1.1.1.1"
    #     "1.0.0.1"
    #   ];
    #   dnsovertls = "true";
    # };
  };

  networking = {
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
  };

  security.rtkit.enable = true;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  # I'm not chinese, but cache.nixos.org is awful slow where I live
  nix.settings.substituters = map (url: "${url}/nix-channels/store") [
    "https://mirrors.ustc.edu.cn"
    # "https://mirrors6.tuna.tsinghua.edu.cn"
    "https://mirrors.tuna.tsinghua.edu.cn"
    "https://mirror.sjtu.edu.cn"
  ];
}
