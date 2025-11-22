{pkgs, ...}: {
  programs.steam = {
    enable = true;
  };

  programs.gamescope = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    dwarfs
    fuse3
    fuse-overlayfs
    bubblewrap
    gamescope
    gamemode
    vkbasalt
    vkbasalt-cli
    mangohud
    protonup-qt
    lutris
    heroic
    osu-lazer-bin
    protonplus
    temurin-jre-bin-21
    ryubing
    wineWowPackages.stable
    (prismlauncher.override {
      jdks = [
        temurin-jre-bin-21
        temurin-jre-bin-17
        temurin-jre-bin-8
      ];
    })
  ];
}
