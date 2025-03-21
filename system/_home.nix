{
  inputs',
  self',
  ...
}:
{
  home-manager = {
    verbose = true;
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "home.old";

    extraSpecialArgs = {
      inherit
        inputs'
        self'
        ;
    };
    sharedModules = [
      {
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
