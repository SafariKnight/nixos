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

  hjem.users.kareem = {
    packages = with pkgs; [
      qbittorrent
      p7zip-rar
      input-remapper
      typst
      gemini-cli
      usbutils
      flatpak-xdg-utils
      yazi
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      (pkgs.mpv.override {
        scripts = with pkgs.mpvScripts; [
          uosc
          thumbfast
        ];
      })
      tealdeer
      pinta

      nodejs
      nodejs.pkgs.pnpm
      bun

      # VCS
      git
      lazygit
      jujutsu
      jjui
      jj-push

      # TMux
      tmux
      tmux-session

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
      ripgrep
      bat
      fd
      television

      # Neovim
      self.packages.${pkgs.stdenv.hostPlatform.system}.knv
      wl-clipboard-rs
    ];
  };
}
