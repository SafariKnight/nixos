{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.gpu-screen-recorder.enable = true;
  programs.fish.enable = true;
  programs.kdeconnect.enable = true;

  hardware = {
    usb-modeswitch.enable = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  programs.command-not-found.enable = false;
  programs.droidcam.enable = true;

  environment.systemPackages = with pkgs; [
    vivaldi
    ungoogled-chromium
    gpu-screen-recorder
    rustdesk
    gpu-screen-recorder-gtk
    wget
    git
    wl-clipboard
    wl-color-picker
    ripgrep
    fd
    gcc
    fzf
    eza
    feh
    trash-cli
    bat
    nixfmt-rfc-style
    tree
    pavucontrol
    obs-studio
    libnotify
    kdePackages.ark
    qalculate-qt
    libqalculate
    dwarfs
    bubblewrap
    fuse-overlayfs
    fuse
    obsidian
  ];

  fonts.packages = with pkgs; [
    fira
    inter
    noto-fonts
    jetbrains-mono
    adwaita-fonts
    roboto
    hack-font
    iosevka
    corefonts
    vistafonts
    nerd-fonts.symbols-only
  ];
}
