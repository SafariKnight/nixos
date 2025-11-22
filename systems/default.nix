{
  inputs,
  withSystem,
  self,
  ...
}: let
  inherit (inputs.nixpkgs) lib;
  mkSystem = system: name:
    withSystem system ({
      inputs',
      self',
      ...
    }:
      lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs inputs' self' self;
        };
        modules = lib.flatten [
          ./common.nix
          (lib.pipe (lib.filesystem.listFilesRecursive ./${name}) [
            (lib.filter (n: lib.hasSuffix ".nix" n))
            (map builtins.toString)
            (lib.filter (n: !(lib.hasInfix "_" n)))
          ])
        ];
      });
  impure = name:
    self.nixosConfigurations.${name}.extendModules {
      modules = [{impurity.enable = true;}];
    };
in {
  flake.nixosConfigurations = {
    krypton = mkSystem "x86_64-linux" "krypton";
    krypton-impure = impure "krypton";
  };
}
