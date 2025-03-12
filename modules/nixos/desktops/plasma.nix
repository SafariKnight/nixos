{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.desktop.plasma;
in
{
  options = {
    modules.desktop.plasma.enable = lib.mkEnableOption "Enable KDE Plasma DE";
  };
  config = lib.mkIf cfg.enable {
    # modules.desktop.plasma.enable = lib.mkDefault true;
    services.desktopManager.plasma6.enable = true;
  };
}
