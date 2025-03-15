{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.nix.nh;
in
{
  options = {
    modules.nix.nh.flakePath = lib.mkOption {
      description = lib.mdDoc "Path of the flake for nh to use";
      type = lib.types.str;
    };
  };
  config = {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = cfg.flakePath;
    };
  };
}
