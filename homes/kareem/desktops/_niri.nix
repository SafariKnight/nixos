{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    modules.niri.enable = lib.mkEnableOption "Enable Niri Wayland Compositor";
  };
  config = lib.mkIf config.modules.niri.enable {
    home.packages = with pkgs; [
      niri
      xwayland-satellite
      cliphist
      # cosmic-files
      xfce.thunar
      # # install system level instead of here
      # xdg-desktop-portal-gnome
      # xdg-desktop-portal-gtk
      gnome-keyring
      swaybg
    ];
    xdg.configFile.niri = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/dotfiles/niri/";
      recursive = true;
    };
  };
}
