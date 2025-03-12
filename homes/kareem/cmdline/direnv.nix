{ ... }:
{
  programs.direnv = {
    enable = true;
    silent = true;
    config = {
      disable_stdin = true;
    };
    nix-direnv.enable = true;
  };
}
