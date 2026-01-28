{
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    configurations.nixos = lib.mkOption {
      type = with lib.types; lazyAttrsOf deferredModule;
      default = {};
    };
    configurations.hjem = lib.mkOption {
      type = with lib.types; lazyAttrsOf deferredModule;
      default = {};
    };
  };
  config = {
    flake.nixosConfigurations = lib.flip lib.mapAttrs config.configurations.nixos (
      _name: module: (inputs.nixpkgs.lib.nixosSystem {
        modules = [
          module
          config.flake.modules.nixos.base
        ];
      })
    );
    flake.modules.nixos = lib.flip lib.mapAttrs' config.configurations.hjem (
      name: module: (
        lib.nameValuePair
        "user/${name}"
        {
          imports = [
            module
            config.flake.modules.nixos.hjem
          ];
        }
      )
    );
  };
}
