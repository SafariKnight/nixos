{
  self,
  pkgs,
  ...
}: {
  time.timeZone = "Africa/Cairo";

  i18n.defaultLocale = "en_US.UTF-8";

  services.flatpak.enable = true;

  programs.direnv = {
    silent = true;
    enable = true;
    nix-direnv.enable = true;
  };

  users.users.kareem = {
    extraGroups = [
      "wheel"
      "libvirtd"
      "incus-admin"
      "fuse"
    ];
    shell = pkgs.dash;
    enable = true;
  };

  hjem.users.kareem = let
    mpvWithScripts = pkgs.mpv.override {
      scripts = with pkgs.mpvScripts; [
        uosc
        thumbfast
      ];
    };
  in {
    packages = with pkgs; [
      qbittorrent
      p7zip-rar
      input-remapper
      typst
      gemini-cli
      usbutils

      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      # stremio-mpv
      mpvWithScripts

      tealdeer

      nodejs
      nodejs.pkgs.pnpm
      bun

      pinta

      # VCS
      git
      lazygit
      jujutsu
      jj-push

      # TMux
      tmux
      tmux-session

      # Yazi
      yazi

      # Helix
      helix
      nixd
      typescript
      typescript-language-server
      vscode-langservers-extracted
      emmet-language-server
      basedpyright
      kdePackages.qtdeclarative

      # Ghostty
      ghostty

      # Fish
      direnv
      carapace
      fish
      nix-your-shell
      zoxide
      starship
      oh-my-posh
      atuin
      eza
      lsr
      ripgrep
      bat
      fd
      television

      emacs-pgtk

      # Neovim
      self.packages.${pkgs.stdenv.hostPlatform.system}.knv
      wl-clipboard-rs
    ];
  };
}
