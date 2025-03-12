{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.desktop.sway;
in
{
  options = with lib; {
    modules.desktop.sway.enable = mkEnableOption "Enable Sway WM";
    modules.desktop.sway.systemd.enable = mkEnableOption "Sway SystemD integratiions";
    modules.desktop.sway.xwayland.enable = mkEnableOption "Sway xWayland";
    modules.desktop.sway.fx = mkEnableOption "Use SwayFX instead of Sway";
  };
  config = lib.mkIf cfg.enable {
    programs.sway = {
      enable = true;
      xwayland.enable = cfg.xwayland.enable;
      package = if cfg.fx then pkgs.swayfx else pkgs.sway;
    };
  };
}
