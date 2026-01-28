{
  configurations.hjem.kareem = {
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
      rum.programs.direnv = {
        enable = true;
        settings.global = {
          warn_timeout = "0s";
          log_format = "-";
          log_filter = "^$";
        };
        integrations = {
          nix-direnv.enable = true;
          fish.enable = true;
        };
      };
      rum.programs.starship = {
        enable = true;
        settings = {
          add_newline = false;
          character = {
            error_symbol = "[❯](red)";
            success_symbol = "[❯](purple)";
            vimcmd_symbol = "[❮](green)";
          };
          cmd_duration = {
            format = "[$duration]($style) ";
            style = "yellow";
          };
          directory = {
            style = "blue";
            truncate_to_repo = false;
            truncation_length = 999;
          };
          format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$line_break$character\n";
          git_branch = {
            format = "[$branch]($style)";
            style = "bright-black";
          };
          git_state = {
            format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
            style = "bright-black";
          };
          git_status = {
            conflicted = "​";
            deleted = "​";
            format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
            modified = "​";
            renamed = "​";
            staged = "​";
            stashed = "≡";
            style = "cyan";
            untracked = "​";
          };
        };
        integrations.fish.enable = true;
        transience.enable = true;
      };
      rum.programs.zoxide = {
        enable = true;
        flags = ["--cmd cd"];
        integrations.fish.enable = true;
      };
      rum.programs.nix-your-shell = {
        enable = true;
        integrations.fish.enable = true;
      };
      ext.programs.tv = {
        enable = true;
        integrations.fish.enable = true;
      };
    };
  };
}
