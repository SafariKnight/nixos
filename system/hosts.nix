{
  inputs,
  lib,
  withSystem,
  config,
  ...
}:
let
  # Get a list of directories in ../hosts
  hostDirs =
    builtins.readDir ../hosts
    |> lib.filterAttrs (name: type: type == "directory")
    |> builtins.attrNames;

  # Function to import all nix files from a directory
  importDir =
    dir:
    lib.filesystem.listFilesRecursive dir
    |> builtins.filter (file: lib.hasSuffix ".nix" file)
    |> builtins.filter (file: !(lib.hasInfix "_" file));

  # Function to import a module path
  importModule = modulePath: importDir (../modules/nixos + "/${modulePath}");

  # Function to create a NixOS configuration for a machine
  makeNixosConfig =
    machineName:
    let
      definition = import ../hosts/${machineName}/definition.nix;

      # Define the modules to be imported
      hostModules =
        [
          {
            networking.hostName = definition.hostname;
            system.stateVersion = definition.stateVersion;

            # Configure users
            users.users = lib.genAttrs definition.users (username: {
              isNormalUser = true;
              extraGroups = lib.optional (builtins.elem username definition.sudoers) "wheel";
            });

            nixpkgs =
              {
                hostPlatform = definition.system;
                flake = {
                  source = inputs.nixpkgs.outPath;
                };
              }
              // (import ./_nixpkgs.nix {
                inherit inputs;
                system = definition.system;
              });
          }
        ]
        ++ (definition.modules |> builtins.concatMap importModule)
        ++ (
          lib.filesystem.listFilesRecursive ../hosts/${definition.hostname}
          |> lib.filter (n: (builtins.baseNameOf n) != "definition.nix")
          |> lib.filter (n: lib.hasSuffix ".nix" n)
          |> lib.filter (n: !(lib.hasInfix "_" n))
        )
        ++ (lib.optional definition.homeManager inputs.home-manager.nixosModules.home-manager)
        ++ (lib.optional definition.homeManager (
          import ./_hostHomes.nix {
            inherit inputs withSystem config;
            host = definition.hostname;
          }
        ));

    in
    inputs.nixpkgs.lib.nixosSystem {
      system = definition.system;
      modules = hostModules;
      specialArgs = { inherit inputs lib; };
    };
in
{
  flake.nixosConfigurations = lib.genAttrs hostDirs makeNixosConfig;
}
