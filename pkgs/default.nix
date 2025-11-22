{inputs, ...}: let
  packages' = pkgs':
    pkgs'.lib.packagesFromDirectoryRecursive {
      inherit (pkgs') callPackage;
      directory = ./packages;
    };
in {
  flake.overlays.default = _: packages';
  perSystem = {pkgs, ...}: {
    packages =
      (packages' pkgs)
      // {
        knv = import ./special/knv {
          inherit inputs pkgs;
        };
      };
  };
}
