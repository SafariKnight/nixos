{
  inputs,
  withSystem,
  config,
  ...
}:
let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
  inherit (builtins) readDir concatLists;
  inherit (lib)
    mkForce
    filterAttrs
    attrNames
    # attrValues
    listToAttrs
    # mapAttrs
    elem
    map
    filter
    hasSuffix
    hasPrefix
    ;

  inherit (lib.filesystem) listFilesRecursive;

  hostDirectories = readDir ../hosts |> filterAttrs (_: v: v == "directory") |> attrNames;
  userDirectories = readDir ../homes |> filterAttrs (_: v: v == "directory") |> attrNames;

  homes =
    hostDirectories
    |> map (
      host:
      let
        hostDef = import ../hosts/${host}/definition.nix { };
      in
      withSystem hostDef.system (
        {
          pkgs,
          inputs',
          self',
          system,
          ...
        }:
        userDirectories
        |> filter (user: elem user hostDef.users)
        |> map (
          user:
          let
            userDef = import ../homes/${user}/definition.nix;
          in
          {
            name = "${userDef.username}@${host}";
            value = inputs.home-manager.lib.homeManagerConfiguration {
              pkgs = pkgs;
              extraSpecialArgs = { inherit inputs' self' system; };
              modules =
                (
                  listFilesRecursive ../homes/${user}
                  |> filter (n: baseNameOf n != "definition.nix")
                  |> filter (n: hasSuffix ".nix" n)
                  |> filter (n: !(baseNameOf n |> hasPrefix "_"))
                )
                ++ [
                  {
                    home = {
                      stateVersion = userDef.stateVersion;
                      username = userDef.username;
                      homeDirectory = userDef.homeDirectory;
                    };
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
        )
      )
    )
    |> concatLists
    |> listToAttrs;
in
{
  flake.homeConfigurations = homes;
}
