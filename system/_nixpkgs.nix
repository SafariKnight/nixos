{ system, inputs, ... }:
let

  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
  inherit (builtins) baseNameOf;
  inherit (lib)
    filter
    map
    mapAttrs
    hasSuffix
    removeSuffix
    listToAttrs
    ;
  inherit (lib.filesystem) listFilesRecursive;
in
{
  inherit system;
  overlays = [
    (
      final: prev:
      listFilesRecursive ./_pkgs
      |> filter (n: hasSuffix ".nix" n)
      |> map (n: {
        name = (baseNameOf n |> removeSuffix ".nix");
        value = n;
      })
      |> listToAttrs
      |> mapAttrs (_: v: (final.pkgs.callPackage v { }))
    )
  ];
  config = {
    allowUnfree = true;
  };
}
