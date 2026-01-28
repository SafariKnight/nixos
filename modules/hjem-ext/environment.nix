{
  flake.modules.hjem.ext = {
    lib,
    config,
    ...
  }: let
    inherit (lib.attrsets) mapAttrsToList;
    inherit (lib.strings) concatStringsSep;

    cfg = config.environment.sessionVariables;

    toEnvironmentD = vars:
      concatStringsSep "\n" (mapAttrsToList (name: value: "${name}=${value}") vars);
  in {
    config = {
      environment.sessionVariables = {
        XDG_CONFIG_HOME = "${config.directory}/.config";
        XDG_DATA_HOME = "${config.directory}/.local/share";
        XDG_CACHE_HOME = "${config.directory}/.cache";
        XDG_STATE_HOME = "${config.directory}/.local/state";
      };
      files.".config/environment.d/10-hjem.conf" = {
        text = toEnvironmentD cfg;
      };
    };
  };
}
