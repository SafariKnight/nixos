{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cemu
    dolphin-emu
    dolphin-emu-primehack
    gamemode
    pcsx2
    ppsspp
    duckstation
    bsnes-hd
    ryujinx-greemdev
    mgba
    flycast
    melonDS
    gamescope
    (retroarch.withCores (
      cores: with cores; [
        parallel-n64
        mgba
      ]
    ))
    libretro.parallel-n64
  ];
}
