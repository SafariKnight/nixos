{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs) lib;
  fs = lib.fileset;

  npinsToPlugins = input: builtins.mapAttrs (_: v: v {inherit pkgs;}) (import ./npins.nix {inherit input;});

  knv = inputs.mnw.lib.wrap pkgs {
    neovim = pkgs.neovim-unwrapped;

    initLua =
      # lua
      ''
        require("config")

        lz = require("lz.n")
        lz.load("plugins")

        require("lzn-auto-require").enable()
      '';

    aliases = [
      "vi"
      "vim"
    ];
    extraBinPath = with pkgs; [
      imagemagick
      ghostscript
      tectonic
      mermaid-cli

      lua-language-server
      stylua

      basedpyright
      ruff

      nixd
      alejandra

      tinymist
      websocat

      vscode-langservers-extracted
      tailwindcss-language-server
      nodejs.pkgs.typescript
      vtsls
      emmet-language-server
      svelte-language-server
      angular-language-server

      phpactor

      rust-analyzer

      gopls
      gofumpt
      golines
      goimports-reviser

      ffmpeg-full
      imagemagick

      sqlite
      postgresql

      ripgrep
      fd
      fzf
    ];

    plugins = {
      dev.kareem = {
        pure = fs.toSource {
          root = ./.;
          fileset = fs.unions [
            ./lua
          ];
        };
        impure = "/home/kareem/repositories/github.com/SafariKnight/nixos/modules/pkgs/_special/knv";
      };

      startAttrs = npinsToPlugins ./start.json;

      start = [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      ];

      optAttrs =
        {
          "blink.cmp" = pkgs.callPackage ./packages/blink-cmp.nix {};
        }
        // npinsToPlugins ./opt.json;
    };
  };
in
  knv
