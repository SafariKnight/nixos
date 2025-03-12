{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraPkgs =
        pkgs: with pkgs; [
          dolphin-emu
          dolphin-emu-primehack
          pcsx2
          ppsspp
          duckstation
          bsnes-hd
          ryujinx-greemdev
          mgba
          flycast
          melonDS
          gamescope
          gamemode
          mangohud
        ];
    })
  ];
}
