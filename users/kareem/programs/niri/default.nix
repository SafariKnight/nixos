{
  lib,
  inputs,
  pkgs,
  ...
}: {
  environment.etc."xdg/menus/plasma-applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  services.gvfs.enable = true;

  hjem.users.kareem = {
    packages = with pkgs; [
      kdePackages.dolphin
      kdePackages.ark
      kdePackages.kio-extras
      kdePackages.kio-fuse
      kdePackages.qtsvg
      kdePackages.kservice

      feh

      helium

      gpu-screen-recorder
      gpu-screen-recorder-gtk

      rofi

      inputs.vicinae.packages.${pkgs.stdenv.hostPlatform.system}.default

      mako

      xorg.setxkbmap
      xwayland-satellite
    ];
    rum.desktops.niri = {
      config = lib.concatMapStringsSep "\n" builtins.readFile (
        lib.pipe (lib.filesystem.listFilesRecursive ./.) [
          (lib.filter (n: n != ./default.nix))
        ]
      );
      extraVariables = {
        QT_QPA_PLATFORM = "wayland";
        XDG_MENU_PREFIX = "plasma-";
      };
      enable = true;
    };
  };

  programs.niri.enable = true;
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
    ];
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      niri."org.freedesktop.impl.portal.FileChooser" = "gtk";
      common.default = "gnome";
      obs.default = "gnome";
    };
  };
}
