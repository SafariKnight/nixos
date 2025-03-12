{
  inputs,
  self,
  withSystem,
  config,
  ...
}:
let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
  inherit (builtins) readDir baseNameOf;
  inherit (lib)
    filter
    flatten
    map
    attrNames
    isString
    isPath
    isAttrs
    filterAttrs
    listToAttrs
    hasInfix
    hasPrefix
    hasSuffix
    pathIsRegularFile
    nixosSystem
    elem
    ;
  inherit (lib.filesystem) listFilesRecursive;

  hostDirectories = readDir ../hosts |> filterAttrs (_: v: v == "directory") |> attrNames;

  hostConfigurations =
    hostDirectories
    |> map (
      directory:
      let
        defs = import ../hosts/${directory}/definition.nix { };
        modulesFromStrings =
          defs.modules
          |> filter isString
          |> map (f: ../modules/nixos/${f})
          |> map listFilesRecursive
          |> flatten
          |> filter (f: hasSuffix ".nix" f)
          |> filter (n: !(baseNameOf n |> hasPrefix "_"))
          |> map (f: import f);

        modulesFromPaths = defs.modules |> filter isPath |> filter pathIsRegularFile |> map (f: import f);

        modulesFromAttrs = defs.modules |> filter isAttrs;
      in
      {
        name = directory;
        value = nixosSystem {
          specialArgs = { inherit inputs self; };
          modules =
            flatten [
              {
                users.users =
                  defs.users
                  |> map (name: {
                    name = name;
                    value = {
                      isNormalUser = true;
                      extraGroups = (if elem name defs.sudoers then [ "wheel" ] else [ ]);
                      # shell = withSystem defs.system ({ pkgs, ... }: pkgs.bash);
                    };
                  })
                  |> listToAttrs;
                networking.hostName = defs.hostname;
                system.stateVersion = defs.stateVersion;
                nixpkgs =
                  {
                    hostPlatform = defs.system;
                    flake = {
                      source = nixpkgs.outPath;
                    };
                  }
                  // (import ./_nixpkgs.nix {
                    inherit inputs;
                    system = defs.system;
                  });

              }
              modulesFromStrings
              modulesFromPaths
              modulesFromAttrs
              (
                listFilesRecursive ../hosts/${directory}
                |> filter (n: (baseNameOf n) != "definition.nix")
                |> filter (n: hasSuffix ".nix" n)
                |> filter (n: !(hasInfix "_" n))
              )
            ]
            ++ (
              if defs.homeManager then
                [
                  inputs.home-manager.nixosModules.home-manager
                  (import ./_hostHomes.nix {
                    inherit inputs withSystem config;
                    host = directory;
                  })
                ]
              else
                [ ]
            );
        };
      }
    )
    |> flatten
    |> listToAttrs;

in
{
  flake.nixosConfigurations = hostConfigurations;
}
