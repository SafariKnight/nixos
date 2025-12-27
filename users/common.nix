{
  inputs,
  self,
  pkgs,
  ...
}: {
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
      (import ./../modules/hjem-ext)
    ];
  };
}
