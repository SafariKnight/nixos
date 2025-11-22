{
  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;
      imports = [
        ./pkgs
        ./systems
        ./users
        inputs.treefmt-nix.flakeModule
        inputs.flake-parts.flakeModules.modules
      ];
      perSystem = {
        pkgs,
        self',
        ...
      }: {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              npins
              self'.packages.knv.devMode

              just
              fyi
            ];
          };
        };
        treefmt = {
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true;
            statix.enable = true;
            deadnix.enable = true;
            kdlfmt.enable = true;
            fish_indent.enable = true;
            shfmt.enable = true;
            stylua = {
              enable = true;
              settings = {
                column_width = 80;
                line_endings = "Unix";
                indent_type = "Spaces";
                indent_width = 2;
                quote_style = "AutoPreferDouble";
                call_parentheses = "NoSingleTable";
              };
            };
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

    # Alphabetically sorted
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs = {
        hjem.follows = "hjem";
        nixpkgs.follows = "nixpkgs";
      };
    };

    impurity.url = "github:outfoxxed/impurity.nix";

    mnw.url = "github:Gerg-L/mnw";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix.url = "github:numtide/treefmt-nix";

    vicinae.url = "github:vicinaehq/vicinae";
  };
}
