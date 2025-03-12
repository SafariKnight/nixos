{
  perSystem =
    { ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";
        programs.nixfmt.enable = true;
        programs.stylua.enable = true;
        programs.prettier.enable = true;
      };
    };
}
