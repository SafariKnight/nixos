{lib, ...}: let
  mkUser = name: {
    imports = lib.flatten [
      (lib.pipe (lib.filesystem.listFilesRecursive ./${name}) [
        (lib.filter (n: lib.hasSuffix ".nix" n))
        (map builtins.toString)
        (lib.filter (n: !(lib.hasInfix "_" n)))
      ])
      ./common.nix
      {
        hjem.users.${name}.enable = true;
        users.users.${name} = {
          isNormalUser = true;
          enable = true;
        };
      }
    ];
  };
in {
  flake.hjemConfigurations = {
    kareem = mkUser "kareem";
  };
}
