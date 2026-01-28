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
    environment.sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      XDG_MENU_PREFIX = "plasma-";

      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_ENABLE_HIGHDPI_SCALING = "1";
      QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
    };
    rum.desktops.niri = {
      config = lib.concatMapStringsSep "\n\n" builtins.readFile (
        lib.pipe (lib.filesystem.listFilesRecursive ./.) [
          (lib.filter (n: n != ./default.nix))
        ]
      );
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
      common."org.freedesktop.impl.portal.FileChooser" = "kde";
      niri."org.freedesktop.impl.portal.FileChooser" = "kde";
      common.default = "gnome";
      obs.default = "gnome";
    };
  };
}
