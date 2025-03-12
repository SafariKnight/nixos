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
      uwsm = lib.mkOption {
        description = lib.mdDoc "Launch Hyprland via UWSM";
        type = lib.types.bool;
      };
      keyPrefix = lib.mkOption {
        description = lib.mdDoc "Prefix for all hyprland keybindings";
        type = lib.types.str;
      };
    };
  };
  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = cfg.uwsm;
    };
    modules.desktop.hyprland.keyPrefix = lib.mkOverride 150 (if cfg.uwsm then "uwsm app -- " else "");
    security.polkit.enable = true;
  };
}
