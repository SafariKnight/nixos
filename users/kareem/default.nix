{
  pkgs,
  self,
  ...
}: {
  time.timeZone = "Africa/Cairo";

  i18n.defaultLocale = "en_US.UTF-8";

  services.flatpak.enable = true;

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
      ouch
      typst
      usbutils
      flatpak-xdg-utils
      amp-cli
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      tealdeer
      pinta

      nodejs
      nodejs.pkgs.pnpm
      bun

      # TMux
      tmux
      tmux-session

      # Neovim
      self.packages.${pkgs.stdenv.hostPlatform.system}.knv
      wl-clipboard-rs
    ];
  };
}
