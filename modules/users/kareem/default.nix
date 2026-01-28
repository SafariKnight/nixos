{self, ...}: {
  configurations.hjem.kareem = {pkgs, ...}: {
    time.timeZone = "Africa/Cairo";
    i18n.defaultLocale = "en_US.UTF-8";
    services.flatpak.enable = true;

    users.users.kareem = {
      isNormalUser = true;
      enable = true;
      extraGroups = [
        "wheel"
        "libvirtd"
        "incus-admin"
        "fuse"
        "i2c"
      ];
      shell = pkgs.dash;
    };

    hjem.users.kareem = {
      enable = true;
      packages = with pkgs; [
        bruno
        jetbrains-toolbox
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
        tmux
        tmux-session
        self.packages.${pkgs.stdenv.hostPlatform.system}.knv
        wl-clipboard-rs
      ];
    };
  };
}
