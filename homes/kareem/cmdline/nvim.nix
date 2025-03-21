{
  config,
  pkgs,
  ...
}:
{
  # stylix.targets.neovim.enable = false;
  xdg.configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/homes/kareem/cmdline/nvim/";
  xdg.configFile.nvimo.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/homes/kareem/cmdline/nvimo/";
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  home.packages = with pkgs; [
    # Language Servers
    vue-language-server
    typescript-language-server
    svelte-language-server
    typescript-language-server
    typescript
    basedpyright
    markdown-oxide
    gopls
    nixd
    nil
    lua-language-server
    tailwindcss-language-server
    vscode-langservers-extracted
    emmet-language-server

    # Formatters
    treefmt
    stylua
    shfmt
    nodejs.pkgs.prettier
    nixfmt-rfc-style
    gofumpt
    golines
    goimports-reviser
    ruff
    nixfmt-rfc-style
    alejandra

    # Linters
    eslint

    # Debuggers
    delve
  ];
  home.sessionVariables = {
    VUE_TYPESCRIPT_PLUGIN = "${pkgs.vue-language-server}/lib/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin";
    TSSERVERJS = "${pkgs.typescript}/lib/node_modules/typescript/lib";
  };
}
