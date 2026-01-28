{inputs, ...}: {
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = {
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
        prettier = {
          enable = true;
          settings = {
            printWidth = 80;
            useTabs = false;
          };
        };
        taplo.enable = true;
        yamlfmt.enable = true;
      };
      settings.global.excludes = [".direnv" ".git" ".jj"];
    };
  };
}
