{pkgs, ...}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamescope = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Dependencies
    dwarfs
    fuse3
    fuse-overlayfs
    bubblewrap
    temurin-jre-bin-21

    # Utility
    gamescope
    gamemode
    vkbasalt
    vkbasalt-cli
    mangohud
    protonplus
    wineWowPackages.stable
    input-remapper
    sgdboop

    # PC Gaming
    lutris
    heroic
    (prismlauncher.override {
      jdks = [
        temurin-jre-bin-21
        temurin-jre-bin-17
        temurin-jre-bin-8
      ];
    })

    # Emulation
    ryubing
  ];
}
