{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.hyprland;
in
{
  options = {
    modules.desktop.hyprland = {
      enable = lib.mkEnableOption "Enable Hyprland WM";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
    };
    security.polkit.enable = true;
  };
}
