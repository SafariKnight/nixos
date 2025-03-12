{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.boot.sddm;
in
{
  options = {
    modules.boot.sddm.enable = lib.mkEnableOption "Enable SDDM";
  };
  config = lib.mkIf cfg.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
}
