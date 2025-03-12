{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      qbittorrent-enhanced
      fastfetch
      gparted
      xorg.xhost
      thunderbird
      just
      gimp
      krita
      inkscape
      tlrc
    ];
    sessionVariables = {
      HYPRCURSOR_SIZE = 24;
      XCURSOR_SIZE = 24;
    };
    pointerCursor = {
      name = "Bibata-Nord";
      package = pkgs.bibata-nord;
      size = 24;
      x11.enable = true;
      gtk.enable = true;
    };
  };
}
