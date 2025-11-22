{
  lib,
  impurity,
  config,
  ...
}: let
  inherit (builtins) toString;
  inherit (lib.attrsets) listToAttrs;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.lists) map;
  inherit (lib.strings) removePrefix hasSuffix removeSuffix;
  inherit (impurity) link;

  source = filepath:
    if (hasSuffix ".nix" filepath)
    then (import filepath config._module.args)
    else (link filepath);

  findFiles = directory: let
    directoryPrefix = (toString directory) + "/";
  in
    listToAttrs
    (map
      (filepath: let
        target = removePrefix directoryPrefix (toString filepath);

        finalTarget =
          if (hasSuffix ".nix" target)
          then (removeSuffix ".nix" target)
          else target;
      in {
        name = "." + finalTarget;
        value.source = source filepath;
      })
      (listFilesRecursive directory));
in {
  hjem.users.kareem.files = findFiles ./_auto;
}
