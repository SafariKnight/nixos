{
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    inputs.nix-index-database.nixosModules.nix-index
  ];

  nix.gc.automatic = lib.mkForce false;
  programs = {
    nh = {
      flake = "${config.users.users.kareem.home}/repositories/github.com/SafariKnight/nixos";
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
    };

    nix-index.enable = true;
    nix-index-database.comma.enable = true;
  };
}
