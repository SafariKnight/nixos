{
  hjem.users.kareem.rum.programs.direnv = {
    enable = true;
    settings = {
      global = {
        warn_timeout = "0s";
        log_format = "-";
        log_filter = "^$";
      };
    };
    integrations = {
      nix-direnv.enable = true;
      fish.enable = true;
    };
  };
}
