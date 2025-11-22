{
  lib,
  inputs,
  pkgs,
  ...
}: {
  hjem.users.kareem = {
    packages = with pkgs; [
      nautilus
      kdePackages.ark

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
      };
      enable = true;
    };
  };

  services.gvfs.enable = true;
  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      niri."org.freedesktop.impl.portal.FileChooser" = "gtk";
      niri.default = "gnome";
      common.default = "gnome";
      obs.default = "gnome";
    };
  };
}
