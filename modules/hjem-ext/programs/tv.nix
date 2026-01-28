{
  flake.modules.hjem.ext = {
    lib,
    pkgs,
    config,
    ...
  }: let
    inherit (lib.meta) getExe;
    inherit (lib.modules) mkAfter mkIf;
    inherit (lib.options) mkEnableOption mkPackageOption;

    cfg = config.ext.programs.tv;
  in {
    options.ext.programs.tv = {
      enable = mkEnableOption "television";

      package = mkPackageOption pkgs "television" {nullable = true;};

      integrations = {
        fish.enable = mkEnableOption "television integration with fish";
        zsh.enable = mkEnableOption "television integration with zsh";
      };
    };

    config = mkIf cfg.enable {
      packages = mkIf (cfg.package != null) [cfg.package];

      rum.programs.fish.config = mkIf cfg.integrations.fish.enable (
        mkAfter "${getExe cfg.package} init fish | source"
      );
      rum.programs.zsh.initConfig = mkIf cfg.integrations.zsh.enable (
        mkAfter "source <(${getExe cfg.package} init zsh)"
      );
    };
  };
}
