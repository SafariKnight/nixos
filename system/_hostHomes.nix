{
  inputs,
  host,
  ...
}:
let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
  inherit (builtins) readDir;
  inherit (lib)
    filterAttrs
    attrNames
    listToAttrs
    elem
    map
    filter
    hasSuffix
    hasInfix
    ;

  inherit (lib.filesystem) listFilesRecursive;

  userDirectories = readDir ../homes |> filterAttrs (_: v: v == "directory") |> attrNames;
  hostDef = import ../hosts/${host}/definition.nix;

  users =
    userDirectories
    |> filter (user: elem user hostDef.users)
    |> map (
      user:
      let
        userDef = import ../homes/${user}/definition.nix;
      in
      {
        name = user;
        value = {
          imports =
            (
              listFilesRecursive ../homes/${user}
              |> filter (n: baseNameOf n != "definition.nix")
              |> filter (n: hasSuffix ".nix" n)
              |> filter (n: !(hasInfix "_" n))
            )
            ++ [
              {
                home = {
                  stateVersion = userDef.stateVersion;
                  username = userDef.username;
                  homeDirectory = userDef.homeDirectory;
                };
                programs.home-manager.enable = true;

                manual = {
                  manpages.enable = false;
                  html.enable = false;
                  json.enable = false;
                };
              }
            ];
        };
      }
    )
    |> listToAttrs;
in
{
  home-manager = {
    verbose = true;
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "home.old.old";

    users = users;

    extraSpecialArgs = {
      inherit inputs;
    };
    sharedModules = [
      {
        # nix.package = mkForce config.nix.package;

        programs.home-manager.enable = true;

        manual = {
          manpages.enable = false;
          html.enable = false;
          json.enable = false;
        };
      }
    ];
  };
}
