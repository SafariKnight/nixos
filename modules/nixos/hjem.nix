{
  inputs,
  self,
  config,
  ...
}: {
  flake.modules.nixos.hjem = {pkgs, ...}: {
    imports = [
      inputs.hjem.nixosModules.hjem
      inputs.impurity.nixosModules.impurity
    ];

    impurity.configRoot = self;
    hjem = {
      clobberByDefault = true;
      linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
      extraModules = [
        inputs.hjem-rum.hjemModules.default
        config.flake.modules.hjem.ext
      ];
    };
  };
}
