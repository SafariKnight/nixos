{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wine
    wine64
    winetricks
    # umu-launcher
  ];
}
