{ inputs, ... }:
let
in
# inherit (inputs) nixpkgs;
# inherit (nixpkgs) lib;
# inherit (builtins) baseNameOf;
# inherit (lib)
#   filter
#   map
#   mapAttrs
#   hasSuffix
#   removeSuffix
#   listToAttrs
#   ;
# inherit (lib.filesystem) listFilesRecursive;
{
  perSystem =
    { system, ... }:
    let
      nixpkgsConfig = import ./_nixpkgs.nix { inherit system inputs; };
    in
    {
      _module.args.pkgs = import inputs.nixpkgs nixpkgsConfig;
    };
}
