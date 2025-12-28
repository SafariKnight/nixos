{
  lib,
  pkgs,
  ...
}: {
  hjem.users.kareem = {
    packages = with pkgs; [
      carapace
      atuin
      eza
      ripgrep
      bat
      fd
      yazi
    ];
    rum.programs.fish = {
      enable = true;
      config = builtins.readFile ./config.fish;
      earlyConfigFiles = lib.pipe (lib.filesystem.listFilesRecursive ./conf.d) [
        (lib.map builtins.baseNameOf)
        (lib.map (lib.removeSuffix ".fish"))
        (lib.map (n: lib.nameValuePair n (builtins.readFile ./conf.d/${n}.fish)))
        builtins.listToAttrs
      ];
      abbrs = {
        cat = "bat";
        grep = "rg";
        find = "fd";
        less = "less -r";

        pn = "pnpm";
        npm = "pnpm";
      };
      aliases = {
        nrepl = "nix repl -f flake:nixpkgs --extra-experimental-features pipe-operators";
      };
      functions = {
        fish_command_not_found = ''
          comma "$argv[1]" $argv[2..-1]
        '';
      };
    };
  };
}
