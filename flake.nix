{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "systems";

    minimal-tmux = {
      url = "github:niksingh710/minimal-tmux-status";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix.url = "github:numtide/treefmt-nix";

    agsBar.url = "path:./modules/flake/ags";
  };
  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports =
        let
          lib = inputs.nixpkgs.lib;
          inherit (builtins) toString;
          inherit (lib) filter;
          inherit (lib.filesystem) listFilesRecursive;
          inherit (lib.strings) hasSuffix hasInfix;
          nixFiles =
            listFilesRecursive ./system
            |> filter (n: hasSuffix ".nix" n)
            |> map toString
            |> filter (n: !(hasInfix "_" n));
        in
        nixFiles
        ++ [
          inputs.home-manager.flakeModules.home-manager
          inputs.treefmt-nix.flakeModule
        ];
    };
}
