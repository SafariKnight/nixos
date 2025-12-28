{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs) lib;
  fs = lib.fileset;

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
        impure = "/home/kareem/repositories/github.com/SafariKnight/nixos/pkgs/special/knv";
      };

      start = inputs.mnw.lib.npinsToPlugins pkgs ./start.json;

      opt =
        [
          pkgs.vimPlugins.nvim-treesitter.withAllGrammars
          (pkgs.callPackage ./_packages/blink-cmp.nix {})
        ]
        ++ inputs.mnw.lib.npinsToPlugins pkgs ./opt.json;
    };
  };
in
  knv
