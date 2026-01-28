{inputs, ...}: let
  packages' = pkgs':
    pkgs'.lib.packagesFromDirectoryRecursive {
      inherit (pkgs') callPackage;
      directory = ./_packages;
    };
in {
  flake.overlays.default = _: packages';
  perSystem = {pkgs, ...}: {
    packages =
      (packages' pkgs)
      // {
        knv = import ./_special/knv {
          inherit inputs pkgs;
        };
      };
  };
}
